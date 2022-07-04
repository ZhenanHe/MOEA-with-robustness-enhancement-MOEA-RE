function [ff,ff1,pbi,score1]=evaluate_robust2(f,pf,n,phi)
%% Reference front for IGD

%% Weight vectors
M=2;
w=generate_vectors(99,M); 
[ss1,ss2]=size(w);
w2=[];
for j=1:ss1
    w2(j,1)=norm(w(j,1:M));
end
%% Test the robust front by adding noise
for ii=1:1000
    for j=1:n
        c(ii,j)=-phi+rand(1)*2*phi; %noise
    end
end
f2=f(:,1:n);
[s1,s2]=size(f2);
ff=cell(s1,1);%each solution
ff1=cell(1000,1); %each generation

for ii=1:1000 %1000 test times
    f3=f2;
    for j=1:n
        f3(:,j)=f2(:,j)+c(ii,j); %jth time:the same scenario for all
    end
    
    for i1=1:s1
        %f4:new front in the current generation
        f4(i1,:)=evaluate_objective(f3(i1,:));
        %ff:all solutions in each generation
        ff{i1,1}=[ff{i1,1};f4(i1,:)];
    end 
    %IGD for f4 in the current generation
    score1(ii,1)=igd(f4(:,n+1:n+M),pf,M);
    rt=[];
    for j=1:ss1
        for j1=1:s1
            d1=f4(j1,n+1:n+M)*w(j,:)'/w2(j,1);
            dt=f4(j1,n+1:n+M)-w(j,:)*(d1/w2(j,1));
            d2=norm(dt);
            rt(j1,1)=d1+5*d2; %PBI
        end
        score2(j,1)=min(rt(:,1));
        pbi(ii,j)=score2(j,1);
    end
    ff1{ii,1}=f4(:,n+1:n+M);
end

