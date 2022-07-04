function f=similarity_check(ak,a,n,phi)

f=[];
[s1,s2]=size(a);%new
[s3,s2]=size(ak); %existing in archive
for i=1:s1
    j=1;
    while j<=s3
        sum1=0;
        for k=1:n
            sum1=sum1+abs(a(i,k)-ak(j,k));
        end
        if sum1<=(phi*0.5)
            j=s3+10;
        end
        j=j+1;
    end
    if j<(s3+5)
       f=[f;a(i,:)];
    end
end