clear 
clc


lego = legoev3('usb');

writeStatusLight(lego, 'green', 'solid');

up = false;
down = false;
left = false;
right = false;


count = 4;

while(count <= 4)
        if(readButton(lego, 'up') == 1 && count == 4) 
            count = count - 1;
            up = true;
            disp("Up button pressed.")
            disp(count);
        
        elseif(readButton(lego, 'down') == 1 && count == 3)
                count = count - 1;
                down = true;
                disp("Down button pressed.")
                disp(count);
        elseif(readButton(lego, 'left') == 1 && count == 2)
                count = count - 1;
                left = true;
                disp("left button pressed.")
                disp(count);
        elseif(readButton(lego, 'right') == 1 && count == 1)
                count = count - 1;
                right = true;
                disp("right button pressed.")
                disp(count);
        if(count == 0 && up == true && down == true && left == true && right == true)
                playTone(lego, 1500, 0.5, 5);
                pause(0.5);
                playTone(lego, 900, 0.5, 2);
                writeStatusLight(lego, 'green', 'solid');
                writeLCD(lego, 'UNLOCKED');
                count = count + 2;
    
        if(count == 0 && up == 0 && down == 0 && left == 0 && right == 0)
                writeStatusLight(lego, 'red', 'pulsing');
                pause(2)
                writeStatusLight(lego, 'off');
        end
        end
        end
end



