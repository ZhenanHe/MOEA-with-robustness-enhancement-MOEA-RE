function f=TP12(x)
[s1,n]=size(x);
x(1,n+1)=cos(pi*x(1,1)/2); %f1
g=0;
for i=2:n
    g=g+x(1,i);
end
g=1+10*g/(n-1);
x(1,n+2)=g*sin(pi*x(1,1)/2);  %f2
f=x;
