function [alpha,beta] = NonLinearToLinear(func, Xmeasured, Ymeasured)
  [linearX,linearY]=func(Xmeasured,Ymeasured);
  
  A=polyRegress(@GaussJor,linearX,linearY,1);
  linearYpredicted=polyValue(A,linearX);
  plot(linearX,linearYpredicted);
  if(func==@PowerEquation)
  beta=A(2);
  alpha=power(10,A(1));
  endif
   if(func==@Exponential)
    beta=A(2);%slope=a1
    alpha=power(exp(1),A(1));%antiln(a0)
   endif
    if(func==@SaturationGrowthRate)
    alpha=1/A(1);
    beta=A(2)*alpha;
    endif
  
endfunction
  