function f=final_solution3(ak,M,n,num,N)
[s1,s2]=size(ak);

if s1<=N
    f=ak;
else
    y=zeros(s1,4);
    for i=1:s1
        y(i,1)=ak(i,M+n+2)/(num-ak(i,M+n+3)+1); %Calculate SP(x_t)
        y(i,2)=ak(i,M+n+4)/(num-ak(i,M+n+3)+1);
        y(i,3)=ak(i,M+n+5)/(num-ak(i,M+n+3)+1);
    end

    sum1=0;sum2=0;
    for i=1:s1
            ak(i,M+n+4)=ak(i,M+n+2)-ak(i,M+n+1)*(num-ak(i,M+n+3)+1);
            ak(i,n+1)=y(i,2);
            ak(i,n+2)=y(i,3);
            sum1=sum1+ak(i,M+n+4)/(num-ak(i,M+n+3)+1);
            sum2=sum2+num-ak(i,M+n+3)+1;
    end
    SM=sum1/s1;
    GM=sum2/s1;
    if GM>30
        GM=30;
    end
    % Calculate S(x_t) of x_t
    for i=1:s1
        if GM>(num-ak(i,M+n+3)+1)
           ak(i,M+n+2)=y(i,1)+SM*(GM-(num-ak(i,M+n+3)+1))/GM;
        else
           ak(i,M+n+2)=y(i,1);
        end
    end
    w1=generate_vectors(99,M);
    w=w1;
    t=ak;
    tt=zeros(s1,1);
    f=[];
    [sn1,ss2]=size(f);

    while sn1<N && ~isempty(w)
        w1=[];
        [N1,ss]=size(w);

        [lf,y]=archive_updating(w,t,n);    
         for i=1:N1
             temp1=lf{i,1}; % Solutions associate with vector i
             [ss1,ss2]=size(temp1);
             if ss1>0
                [r1,r2]=sort(temp1(:,M+n+2));
                i1=1;
                while i1<=ss1
                      tempn=temp1(r2(i1,1),M+n+5);
                      if tt(tempn,1)<1
                         f=[f;temp1(r2(i1,1),:)];
                         tt(tempn,1)=1;
                         i1=ss1+1;
                      end
                      i1=i1+1;
                end
             else
                w1=[w1;w(i,:)];
             end
         end
         w=w1;
         [sn1,ss2]=size(f);
    end
end