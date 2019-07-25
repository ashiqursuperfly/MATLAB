function [root,f_xr,ea,i] = FP_1605103 (fun,xl,xu,es,maxI)
format short
if(fun(xu)*fun(xl)>=0)
printf("Invalid Initial Guess");
else
i=0;
j=1;
ea=es*1.1;
xr=zeros(1,maxI);

while( ea>es && i<maxI)
xr(j)=xu-(fun(xu)*(xl-xu))/(fun(xl)-fun(xu));
root=xr(j);
if(j!=1 && xr(j)!=0)
%printf("xr(j)=%d and xr(i)=%d and",xr(j),xr(i));
ea=abs((xr(j)-xr(i))/xr(j))*100;
if(ea<es)printf("ea minimal :%d\n",ea);
endif
endif
test=fun(xl)*fun(xr(j));
if(test==0)
ea=0;
elseif(test<0)
xu=xr(j);
else
xl=xr(j);
endif  
j++;
i++;
endwhile
root
f_xr=fun(root)
ea=ea
i
endif
endfunction
