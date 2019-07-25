x=[1 2 3 4 5];
y=[1 4 9 16 25];
a = 2.1;

%TASK 1
plot(x,y,'o');
hold on;

%TASK 2
ansSpline = linear_spline(x, y, a);
plot(a,ansSpline,'*');
hold on;

%TASK 3
ansNewton = newton_interpolation(x,y,a);
plot(a,ansNewton,'<>');
hold on;

%TASK 4
X=[1:0.1:5]
n=size(X)(2);
for i=1:n
  Y(i)=newton_interpolation(x,y,X(i));
end
plot(X,Y)
hold on;