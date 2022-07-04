function [f,m2]=find_all(kb,cc,fd,M,n)

[s1,s2]=size(kb);
f=kb(:,1:n+M);

s2=s2-1;
[s3,s4]=size(cc);
m1=100;%m1:min angle between two knees
for i=1:(s1-1)
    t1=kb(i,s2);
    for j=(i+1):s1
        t2=kb(j,s2);
        if m1>cc(t1,t2)
            m1=cc(t1,t2);
        end
    end
end
m2=0;%m1:max distance of all knees
for i=1:s1
    temp1=cumsum(kb(i,n+1:n+M));
    temp2=temp1(1,end);
    if m2<temp2
        m2=temp2;
    end
end

for i=1:s1
    f(i,M+n+1)=kb(i,M+n+2);
    f(i,M+n+2)=kb(i,M+n+2);
end

for i=1:s1
    a=kb(i,s2);
    temp1=cc(a,:);
    [r1,r2]=sort(temp1(1,:));
    temp2=r1(1,2);
    j=2;
    ff=[];
    while temp2<=(m1/2)
         u=r2(1,j);
         temp3=cumsum(fd(u,n+1:n+M));
         temp4=temp3(1,end);
         if temp4<=(m2*1.2) %%1.1?
            tempn(1,1:n+M)=fd(u,1:n+M);
            tempn(1,M+n+1)=temp4;
            tempn(1,M+n+2)=temp4;
            ff=[ff;tempn];
         end
         j=j+1;
         if j>s3
             temp2=m1+10;
         else
             temp2=r1(1,j);
         end
    end 
    [s5,s6]=size(ff);
    if s5>2
        [ss1,ss2]=sort(ff(:,M+n+1));
        for j=1:2
            f=[f;ff(ss2(j,1),1:M+n+2)];
        end
    end
    if s5<=2
        if s5>0
           f=[f;ff(:,1:M+n+2)];
        end
    end
end
