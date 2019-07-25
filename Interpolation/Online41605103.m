x=[1 2 3 4 5];
y=[1 8 27 64 125];
a = 3.2;

%TASK 1
plot(x,y,'o');
hold on;

%TASK 2
%ansSpline = lin_spline(x, y, a);
%plot(a,ansSpline,'*');
%hold on;
%ansSpline
%TASK 3
%ansNewton = newton_IP(x,y,a);
%plot(a,ansNewton,'<>');
%hold on;
%ansNewton

X=[1:1:5];
n=size(X,2);
ans=quad_spline_interpolation(x,y,4.56)
ans
n;
Y=zeros(n);
%for i=1:n
 % Y(i)=newton_IP(x,y,X(i));
%end
%X
%Y
%plot(X,Y);
hold on;
