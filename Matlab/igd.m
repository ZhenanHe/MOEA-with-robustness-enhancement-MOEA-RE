function f=igd(pa,pf,M)
[nr,temp]=size(pf);[na,temp]=size(pa);
%IGD
dis=0;
for i=1:nr
   md=[];
   for j=1:na
       d1=0;
       for j1=1:M
           d1=d1+((pf(i,j1)-pa(j,j1)))^2;
       end
       md(j,1)=d1;
   end
   a1=min(md);
   dis=dis+a1^0.5;
end
f=dis/nr;