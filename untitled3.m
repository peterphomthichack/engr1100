
clear 
clc
lego = legoev3('usb');
writeStatusLight(lego, 'green', 'solid');
count = 0;
while(count <= 4)
    if((readButton(lego, 'left') == 1) & count == 0) || (readButton(lego, 'down') == 1 & count == 1) || (readButton(lego, 'left') == 1 & count == 2) || (readButton(lego, 'right') == 1 & count == 3)
        count = count + 1;
        disp(count);
    elseif((readButton(lego, 'left') == 1) & count ~= 0) || (readButton(lego, 'down') == 1 & count ~= 1) || (readButton(lego, 'left') == 1 & count ~= 2) || (readButton(lego, 'right') == 1 & count ~= 3)
        count = 0;
        writeStatusLight(lego, 'red', 'pulsing');
        pause(2)
        writeStatusLight(lego, 'off');

    end

end