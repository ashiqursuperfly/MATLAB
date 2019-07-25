x=[-2*pi:0.2:2*pi];

plot(x,cos(x));
hold on
plot(x,myCosx_1605103(x,1));
hold on
plot(x,myCosx_1605103(x,3));
hold on
plot(x,myCosx_1605103(x,5));
hold on
plot(x,myCosx_1605103(x,20));
xlabel('X[-2pi,2pi]')
ylabel('cosX')
xlim([-2*pi 2*pi]);
ylim([-1 1])