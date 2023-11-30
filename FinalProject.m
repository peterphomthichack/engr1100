clear;
clc;
lego = legoev3('usb');
clearLCD(lego)
start_program = true;

gyro_sensor = gyroSensor(lego);

sonic_sensor = sonicSensor(lego);

% Color sensor initialization
color_sensor = colorSensor(lego);

% Motors initialization and settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
motor_speed = 30;
motor_speed2 = -30;
right_motor = motor(lego,'C');
left_motor = motor(lego,'B');


right_motor.Speed = motor_speed;
left_motor.Speed = motor_speed;


left_motor2.Speed = motor_speed2;

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
            if(color == "red" && first_stop == false)
                stop(right_motor, 1);
                stop(left_motor, 1);
                pause(3);
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
                    if(angle >= 85 && angle <= 95)
                        left_motor.Speed = motor_speed;
                        stop(right_motor);
                        stop(left_motor);
                        turning = false;
                    end
                end
            end
            if(color == "green")
            stop(right_motor, 1);
            stop(left_motor, 1);
            checking_color = false;
            end
        end
    end
end

%test
