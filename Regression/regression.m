function y = regression (x, y)
  n = length(x);
  if n ~= length(y)
    error('satar matha');  
  endif
  sx = sum(x);
  sy = sum(y);
  sxy = sum(x.*y);
  sx2 = sum(x.*x);
  sy2 = sum(y.*y);
  a1 = (n*sxy - sx*sy) / (n*sx2 - sx*sx);
  a0 = (sy - a1*sx) / n;
  %st = sum((y - sy / n) .^ 2);
  %sr = sum((y - a0 - a1.*x) .^ 2);
  %r2 = (st - sr) / st;
  
  r2 = ((n*sxy - sx*sy) / sqrt(n*sx2 - sx^2) / sqrt(n*sy2 - sy^2)) ^ 2;
  y = [a0, a1, r2];

  xp = linspace(min(x), max(x), 2);
  yp = a0 + a1 .* xp;
  plot(xp, yp);
  grid on;
endfunction
