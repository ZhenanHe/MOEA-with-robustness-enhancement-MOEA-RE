function f = initialize_variables(N,n,phi,func)

for i=1:N
    % Initialize each decision variable
    f1=zeros(1,n);
    for j=1:n
        f1(1,j)=phi+(1-phi*2)*rand(1); %[phi,1-phi] from [0,1]
    end
    % Evaluate the objective function
    f(i,:) = evaluate_objective(f1,func);
end
