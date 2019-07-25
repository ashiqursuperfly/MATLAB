format long
n=[1:49];

for i=1:50 
A(i)=myCosx_1605103(1.5,i);
endfor
error=zeros(1,49);
for i=1:49
  error(i)=(abs((A(i+1)-A(i))/A(i+1)))*100;
endfor
error;
plot(n,error);
xlabel('Number of Iterations');
ylabel('Relative Approximation Error,Ea');
xlim([1 10]);

