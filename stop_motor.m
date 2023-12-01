clear;
clc;
lego = legoev3('usb');
clearLCD(lego)

motor_speed = 30;
right_motor = motor(lego,'C');
left_motor = motor(lego,'B');

stop(right_motor);
stop(left_motor);