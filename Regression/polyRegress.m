function output = polyRegress(func, X, Y, degree)
degree = degree + 1;
%n = numel(X);
A = zeros(degree);
B = zeros(degree, 1);

for it = 1:degree
    for it2 = 1:degree
        temp = X.^(it+it2-2);
        s = sum(temp);
        A(it, it2) = s;
    end
    temp2 = X.^(it-1);
    temp3 = temp2.*Y;
    s2 = sum(temp3);
    B(it) = s2;
end
res = func(A, B);
output = res;
        
    
