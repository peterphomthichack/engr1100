clear;
clc;
count = 0;
myLego = legoev3('usb'); %password is up, down, left, right
disp('Identified robot');
writeStatusLight(myLego, 'orange', 'solid'); %Sets it to a solid orange light
disp('Set as orange')
while(count < 4)
if ((readButton(myLego,'up') == 1) && count == 0) | ...
((readButton(myLego,'down') == 1) && count == 1) | ...
((readButton(myLego,'left') == 1) && count == 2) | ...
((readButton(myLego, 'right') == 1) && count == 3)
count = count + 1;
disp(count);
pause(.5)
elseif ((readButton(myLego,'up') == 1) && count ~= 0) | ...
((readButton(myLego,'down') == 1) && count ~= 1) | ...
((readButton(myLego,'left') == 1) && count ~= 2) | ...
((readButton(myLego, 'right') == 1) && count ~= 3)
disp('wrong button')
count = 0;
writeStatusLight(myLego, 'red', 'pulsing');
pause(2);
writeStatusLight(myLego, 'orange', 'solid');
pause(.5)
end
end
if count == 4
writeStatusLight(myLego, 'green', 'solid');
clearLCD(myLego)
writeLCD(myLego, 'UNLOCKED')
playTone(myLego, 500, 1, 1);
end
