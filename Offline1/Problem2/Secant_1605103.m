function [root,f_xr,ea,iteration] = Secant_1605103(f, x1, x2, es, maxi)
  format long
  xr = zeros(1, maxi);
  xr(1) = x1;
  xr(2) = x2;
  xr(3) = (x1*f(x2)-x2*f(x1))/(f(x2)-f(x1));
  i = 2;
  ea = 1.1*es;

  while (ea>es && i<maxi)
    
    xr(i+2) = ((xr(i)*f(xr(i+1))) - (xr(i+1)*f(xr(i))))/(f(xr(i+1))-f(xr(i)));
    if (xr(i+2)!=0)
    ea = abs((xr(i+2)-xr(i+1))/xr(i+2))*100;
    endif
    i++;
  endwhile
  root = xr(i+1)
  f_xr=f(root)
  ea
  iteration=i-2
  endfunction