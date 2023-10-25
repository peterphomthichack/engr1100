
clear 
clc
lego = legoev3('usb');
writeStatusLight(lego, 'green', 'solid');

correct_count = 0;
press_count = 0;
lock = true;
while (lock == true)
    while (correct_count < 4)
        if(readButton(lego, 'up') == 1) && correct_count == 0
            disp("UP")
            correct_count = correct_count + 1;
            press_count = press_count + 2;
        elseif(readButton(lego, 'down') == 1) && correct_count == 1
            disp("DOWN")
            correct_count = correct_count + 1;
            press_count = press_count + 2;
        elseif(readButton(lego, 'left') == 1) && correct_count == 2
            disp("LEFT")
            correct_count = correct_count + 1;
            press_count = press_count + 2;
        elseif(readButton(lego, 'right') == 1) && correct_count == 3
            disp("RIGHT")
            correct_count = correct_count + 1;
            press_count = press_count + 2;
            disp(correct_count);
            lock = false;
        end
        if(lock == false)
            playTone(lego, 1500, 0.5, 5);
            pause(0.5);
            playTone(lego, 900, 0.5, 2);
            writeStatusLight(lego, 'green', 'solid');
            writeLCD(lego, 'UNLOCKED');
        
        elseif(lock == true) || (press_count >4)
        writeStatusLight(lego, 'red', 'pulsing');
        pause(2)
        writeStatusLight(lego, 'off');
        end
        
    end
end



