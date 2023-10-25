%///////////////////////////////////////////////////////////////////////////////////////////////////
% 1. Find the slope of a linear equation given the following set of points - [8 , 12] and [3 , 26]

x1 = 8; x2 = 3; y1 = 12; y2 = 26;

slope = (y2 - y1) / (x2 - x1);
disp("Slope of linear equation:");
disp(slope);

%///////////////////////////////////////////////////////////////////////////////////////////////////
% 2. Fnd the linear equation using the polyfit() function given:
    %x = [2, 4, 7, 8, 10]
    %y = [10, 8, 6, 4, 2]

x = [2,4,7,8,10];
y = [10,8,6,4,2];
plot1 = polyfit(x,y,1);
disp("Using polyfit() function:");
disp(plot1);

%///////////////////////////////////////////////////////////////////////////////////////////////////
% 3. Plot the linear equation for x = -500:500 using the equation y = 3x + 8

figure('Name','Linear Equation Graph');
x3 = -500:500;
y3 = 3 * x3 + 8;
plot(x3,y3);
title('Linear Equation Graph');
xlabel('X-Axis');
ylabel('Y-Axis');
grid on
axis([0,500,0,1500])

%///////////////////////////////////////////////////////////////////////////////////////////////////
% 4. Solve the quadratic equation where a = 2, b = 8, and c = -9 using BOTH the solve() function and the quadratic formula.

% solve() function:
syms a b c x
a = 2; b = 8; c = -9;
equation = a*x^2+b*x+c == 0;
s_x = solve(equation,x);
disp("Using solve() function:");
disp(s_x);

% Quadradic Formula:

quadr_plus = (-b + sqrt(b^2-4*a*c))/(2*a);
quadr_minus = (-b - sqrt(b^2-4*a*c))/(2*a);
disp("Using Quadratic Formula:");
disp(quadr_minus);
disp(quadr_plus);

%///////////////////////////////////////////////////////////////////////////////////////////////////
% 5. Consider the electricity coming from a wall outlet - this electricity involves alternating current (AC). 
% This is a topic very common to later circuits-related classes because you will need to know how to read, analyze, 
% and plot these potentially complex waveforms. Plot the quadratic equation for x = 0:20 using the equation y = 10*sin(120*x)
% and note that, in this equation, 10 represents the amplitude (or height) of the wave while 120 represents the angular frequency. 
% These values may be unfamiliar to you now, but you will see these again! Be sure to include a plot title and axes labels. 
% Set your range of minimum and maximum x and y to appropriate values (so we can see the entire plot)!


figure('Name','AC Graph');
x4 = 0:20;
y4 = 10*sin(120*x4);
plot(x4,y4);
title('AC Graph');
xlabel('Time');
ylabel('Amplitude');
grid on
axis([0,20,-15,15])
