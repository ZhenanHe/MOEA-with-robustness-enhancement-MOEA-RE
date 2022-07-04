function f=TP14(x)
[s1,n]=size(x);
x(1,n+1)=(exp(x(1,1))-1)/(exp(1)-1); %f1
g=0;
for i=2:n
    g=g+x(1,i);
end
g=1+10*g/(n-1);
x(1,n+2)=g*((sin(4*pi*x(1,1))-15*x(1,1))/15+1);  %f2
f=x;