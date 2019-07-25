function f_x=f_1605103(x)
%Given Function For The Reaction
p=3;
k=0.05;
%f_x=(x/(1-x))*sqrt((2*p)/(2+x))-k;
f_x=(x/(1-x));
f_x=f_x*sqrt((2*p)/(2+x))-k;

endfunction