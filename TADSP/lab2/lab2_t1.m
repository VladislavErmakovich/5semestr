N = 50;
n = 0:N-1;
x1 = (1/2)*sin(2*pi*(2/N).*n);
x2 = cos(2*pi*0.1.*n);
[P1,P1d] = power_xn(x1,N);
[P2,P2d] = power_xn(x2,N);

if sum(x1.*x2)==0
    ortoganal = true;
else
    ortoganal = false; 
end

correlation = 1/N.*sum(x1.*x2);


