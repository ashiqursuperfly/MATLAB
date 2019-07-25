function y = make_eqn (x, a)
  n = length(a);
  xlen = length(x);
  for j = 1 : xlen
    m = 0;
    for i = 1 : n
      m = m + a(i) * x(j) ^ (i-1);
    endfor
    y(j) = m;
  endfor
endfunction
