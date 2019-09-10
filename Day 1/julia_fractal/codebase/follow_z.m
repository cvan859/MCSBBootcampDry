function [z, nmax] = follow_z(z1, c)
% follow_z takes complex numbers z1 and c, then outputs z(n+1)=z(n)^2+c
% once |z|>2 or n>21
% outputs z2 and n when script stops
z(1) = z1;
n = 1;

while (abs(z(n)) <= 2 && (n <= 21))
    z(n+1)= z(n)^2+c;
    n = n+1;
end

nmax = n;