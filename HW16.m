clear; clc;
mylego = legoev3('usb');
clearLCD(mylego);
mycolorsensor = colorSensor(mylego);

% Variables storing the base frequency value for each color
red_base_freg = 50;
yellow_base_freg = 80;
green_base_freg = 100;
blue_base_freg = 120;
brown_base_freg = 140;
black_base_freg = 160;

% timers
delay = 0.3;
tone_dur = 0.2;
tone_vol = 10;


start_button = false;
% Checking the status of the module. If the "Up" button on the module is
% pressed, the second while loop will execute the code below it.
while(start_button == 0)
    if(readButton(mylego, 'up') == 1)
        start_button = true;
        pause(delay);
    end
    while(start_button == 1)
        clearLCD(mylego);
        color = readColor(mycolorsensor);
        fprintf("Color: %s\n", color);
        light_intensity = readLightIntensity(mycolorsensor); % reading the light intensity
        fprintf("Light intensity: %d\n", light_intensity);
        if(color == "red")
            red = red_base_freg * light_intensity + 50; % store the value of base frequency multiply by light intensity plus 50
            fprintf("Frequency: %d\n", red);
            playTone(mylego, red , tone_dur, tone_vol);
            writeLCD(mylego, 'Red');
            pause(delay);
            clearLCD(mylego);
        elseif(color == "yellow")
            yellow = yellow_base_freg * light_intensity + 50;
            fprintf("Frequency: %d\n", yellow);
            playTone(mylego, yellow, tone_dur, tone_vol);
            writeLCD(mylego, 'Yellow');
            pause(delay);
            clearLCD(mylego);
        elseif(color == "green")
            green = green_base_freg * light_intensity + 50;
            fprintf("Frequency: %d\n", green);
            playTone(mylego, green, tone_dur, tone_vol);
            writeLCD(mylego, 'Green');
            pause(delay);
            clearLCD(mylego);
        elseif(color == "blue")
            blue = blue_base_freg * light_intensity + 50;
            fprintf("Frequency: %d\n", blue);
            playTone(mylego, blue, tone_dur, tone_vol);
            writeLCD(mylego, 'Blue');
            pause(delay);
            clearLCD(mylego);
        elseif(color == "brown")
            brown = brown_base_freg * light_intensity + 50;
            fprintf("Frequency: %d\n", brown);
            playTone(mylego, brown, tone_dur, tone_vol);
            writeLCD(mylego, 'Brown');
            pause(delay);
            clearLCD(mylego);
        elseif(color == "black")
            black = black_base_freg * light_intensity + 50;
            fprintf("Frequency: %d\n", black);
            playTone(mylego, black, tone_dur, tone_vol);
            writeLCD(mylego, 'Black');
            pause(delay);
            clearLCD(mylego);
        else
            disp("Out of range");
            writeLCD(mylego, 'Out of range');
            pause(delay);
            clearLCD(mylego);
        end
    end
end
