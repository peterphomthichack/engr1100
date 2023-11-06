clear; clc;
mylego = legoev3('usb');

mycolorsensor = colorSensor(mylego);
button = false;

clearLCD(mylego);

while(button == 0)
    if(readButton(mylego, 'up') == 1)
        button = true;
        pause(0.5);

    end
    while(button == 1)
        clearLCD(mylego);
        color = readColor(mycolorsensor);
        disp(color);
        if(color == "red")
            writeLCD(mylego, 'red');
            pause(1);
            clearLCD(mylego);
        elseif(color == "yellow")
            writeLCD(mylego, 'yellow');
            pause(1);
            clearLCD(mylego);
        elseif(color == "green")
            writeLCD(mylego, 'green');
            pause(1);
            clearLCD(mylego);
        elseif(color == "blue")
            writeLCD(mylego, 'blue');
            pause(1);
            clearLCD(mylego);
        elseif(color == "brown")
            writeLCD(mylego, 'brown');
            pause(1);
            clearLCD(mylego);
        elseif(color == "black")
            writeLCD(mylego, 'black');
            pause(1);
            clearLCD(mylego);
        end
    end
end