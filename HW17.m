clear; clc;
mylego = legoev3('usb');

mygyrosensor = gyroSensor(mylego);
resetRotationAngle(mygyrosensor);
start_button = false;

while(start_button == 0)
    if(readButton(mylego, 'up') == 1)
        start_button = true;
        pause(0.5);
    end
    while(start_button)
        angle = abs(readRotationAngle(mygyrosensor));
        disp(angle);
        if(angle == 0) % North
            writeStatusLight(mylego, 'green', 'solid');
            playTone(mylego, 1500, 1, 10);
            pause(0.2);
        elseif(angle == 180) % South
            writeStatusLight(mylego, 'red', 'solid');
            playTone(mylego, 500, 1, 10);
            pause(0.2);
        elseif(angle == 90) % East and West
            writeStatusLight(mylego, 'orange', 'solid');
            playTone(mylego, 1000, 1, 10);
            pause(0.2);
        else
            writeStatusLight(mylego, 'orange', 'pulsing');
            pause(0.2);
        end
    end   
end