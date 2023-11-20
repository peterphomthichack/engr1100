clear;
mylego = legoev3('usb');
clearLCD(mylego)
% Ultrasonic Sensor
mysonicsensor = sonicSensor(mylego); % Creates connection to ultrasonic sensor

% Motor Ports
mymotor1 = motor(mylego,'B');
mymotor2 = motor(mylego,'C');

% Motor Speeds
speed = 30;
mymotor1.Speed = speed;
mymotor2.Speed = speed;

mygyrosensor = gyroSensor(mylego);
resetRotationAngle(mygyrosensor);

% Sets variables
start_button = false;
button=true;
wheel_stop = false;

while(start_button == false) % While start button is not pressed
   if(readButton(mylego, 'up') == 1) % Starts loop when button is pressed
       pause(0.5)
       start(mymotor1);
       start(mymotor2); 
       while(true)
           proximity = readDistance(mysonicsensor);
           disp(proximity)
           pause(0.02)
           angle = abs(readRotationAngle(mygyrosensor));
           disp(angle);
           if(proximity == 0.5)
               stop(mymotor1,1);
               stop(mymotor2,1);
               wheel_stop = true;
           end
           while(wheel_stop == true && angle ~= 180)
                playTone(mylego, 1000, 0.5, 4);
                start(mymotor2);
           end
       end
   end
end
