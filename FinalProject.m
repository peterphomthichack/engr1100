clear;
clc;
lego = legoev3('usb');
clearLCD(lego)
start_program = true;
tone_delays = 0.3;

gyro_sensor = gyroSensor(lego);

sonic_sensor = sonicSensor(lego);

% Color sensor initialization
color_sensor = colorSensor(lego);

% Motors initialization and settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
black_speed = 30;
motor_speed = 45;
right_motor = motor(lego,'C');
left_motor = motor(lego,'B');

right_motor.Speed = motor_speed;
left_motor.Speed = motor_speed;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
first_stop = false;
checking_color = true;
obstacles = false;

angle_checking = true;
resetRotationAngle(gyro_sensor);
turning = true;
while(start_program)
    if(readButton(lego, 'up') == 1)
        while(checking_color)
            start(right_motor);
            start(left_motor);
            color = readColor(color_sensor);
            checking_obstacles = readDistance(sonic_sensor);
            if(color == "black")
                writeLCD(lego, 'Approching a stop sign!');
                writeStatusLight(lego, 'red', 'pulsing')
                left_motor.Speed = black_speed;
                right_motor.Speed = black_speed;
                writeStatusLight(lego, 'off');
            end
            if(color == "red" && first_stop == false)
                left_motor.Speed = motor_speed;
                right_motor.Speed = motor_speed;
                writeLCD(lego, 'Stopping at the stop sign!');
                playTone(lego, 1000, 3, 10);
                writeStatusLight(lego, 'red', 'pulsing')
                stop(right_motor, 1);
                stop(left_motor, 1);
                pause(3);
                writeLCD(lego, 'Driving to the next point!');
                writeStatusLight(lego, 'green', 'solid');
                first_stop = true;
            end

            if(checking_obstacles <= 0.17 && turning == true)
                disp(checking_obstacles);
                stop(right_motor);
                stop(left_motor);
                pause(0.5);
                left_motor.Speed = -motor_speed;
                start(right_motor);
                start(left_motor);
                angle = abs(readRotationAngle(gyro_sensor));
                while(turning)
                    angle = abs(readRotationAngle(gyro_sensor));
                    disp(angle);
                    if(angle >= 80 && angle <= 100)
                        left_motor.Speed = motor_speed;
                        stop(right_motor);
                        stop(left_motor);
                        turning = false;
                        pause(1);
                    end
                end
            end
            if(color == "green")
                clearLCD(lego)
                writeLCD(lego, 'Checkpoint Arrived!');
                stop(right_motor, 1);
                stop(left_motor, 1);
                writeStatusLight(lego, 'green', 'pulsing');
                playTone(lego, 1000, 1, 10);
                pause(tone_delays);
                playTone(lego, 1500, 1, 10);
                pause(tone_delays);
                playTone(lego, 700, 1, 10);
                pause(tone_delays);
                playTone(lego, 1250, 1, 10);
                pause(tone_delays);
                playTone(lego, 500, 1, 10);
                pause(tone_delays);
                writeStatusLight(lego, 'off');
                checking_color = false;
            end
        end
    end
end
