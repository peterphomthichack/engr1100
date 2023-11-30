% NOTE: The clear command must be use to clear out the stored variables after
% the script was execute each times, or it will give an error.
syms v w x y z
eqn1 = 3*v - w + 2*x + y - z == 2;
eqn2 = -v - w - x - y + z == 3;
eqn3 = -2*v + 4*w - x + 2*y + 3*z == -10;
eqn4 = v + 6*w + x + y -2*z == 2;
eqn5 = 3*v - w - x + 4*y + 2*z ==5;

solve = solve([eqn1, eqn2, eqn3, eqn4, eqn5],[v,w,x,y,z]);
vSolve = solve.v;
wSolve = solve.w;
xSolve = solve.x;
ySolve = solve.y;
zSolve = solve.z;

fprintf("v = %f\n", vSolve);
fprintf("w = %f\n", wSolve);
fprintf("x = %f\n", xSolve);
fprintf("y = %f\n", ySolve);
fprintf("z = %f\n", zSolve);


% 3v – w + 2x + y -z = 2
fprintf("3*%f – %f + 2*%f + %f - %f = %d\n",vSolve,wSolve,xSolve,ySolve,zSolve,3*vSolve - wSolve + 2*xSolve + ySolve - zSolve);

% -v – w – x – y + z = 3
fprintf("-%f - %f - %f - %f + %f = %d\n", vSolve, wSolve, xSolve, ySolve, zSolve, -vSolve - wSolve - xSolve - ySolve + zSolve);

% -2v + 4w -x + 2y + 3z = -10
fprintf("-2*%f + 4*%f - %f + 2*%f + 3*%f = %d\n", vSolve, wSolve, xSolve, ySolve, zSolve, -2*vSolve + 4*wSolve - xSolve + 2*ySolve + 3*zSolve);

% v +6w + x + y – 2z = 2
fprintf("%f + 6*%f + %f + %f - 2*%f = %d\n", vSolve, wSolve, xSolve, ySolve, zSolve, vSolve + 6*wSolve + xSolve + ySolve - 2*zSolve);

% 3v – w – x + 4y + 2z = 5
fprintf("3*%f - %f - %f + 4*%f + 2*%f = %d\n", vSolve, wSolve, xSolve, ySolve, zSolve, 3*vSolve - wSolve - xSolve + 4*ySolve + 2*zSolve);

