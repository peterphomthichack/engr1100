a = 0;
b = 1;
n = 1000;
i = 1;
while (i < n)
    i = i + 1;
    c = a + b;
    a = b;
    b = c;
    fib  = c;
    disp(fib);
end