x=[-1:0.1:1];
for i=1:21
y(i)=f_1605103(x(i));
++i;  
endfor
y;
x;
plot(x,y);
ylabel('Y')
xlabel('X')
xlim([-1 1]);
ylim([-1 12]);
hold on