function [root,f_xr,ea,iteration] = FalsePosition_1605103 (fun,xl,xu,es,maxI)
if(fun(xu)*fun(xl)>=0)
printf("Invalid Initial Guess");
end
iteration=1;
ea=es*1.1;
xr=zeros(1,maxI);
xr(iteration)=xu+xl/2;
while( ea>es && iteration<maxI)
xr(iteration)=xu+xl/2;
if(iteration!=1 && xr(iteration)!=0)
ea=abs((xr(iteration)-xr(iteration-1))/xr(iteration))*100;
endif
test=fun(xl)*fun(xr(iteration));
if(test==0)
ea=0;
elseif(test<0)
xu=xr(iteration);
else
  xl=xr(iteration);
endif  
iteration++;
endwhile
root=xr(iteration-1)
iteration-1
f_xr=fun(xr(iteration-1))
ea=ea
iteration=iteration;
endfunction
