function A = m_polyn_reg (m, x, y)
  
%Here, m is the degree of the polynomial
%x -> independent var
%y = f(x)
%A is the vector if coefficients

  n = length(x);
  if n ~= length(y)
    error('vool...');    
  endif
  for i=1:m+2
    for j=i:m+1
      mat(i, j) = sum(x.^(j+i-2)); 
      mat(j, i) = mat(i, j);
    endfor
  endfor
  mat(1,1) = n;
  for i=0:m
    B(i+1,1) = sum(y.*x.^i);
  endfor
  A = gauss_jordan(mat, B);
endfunction
