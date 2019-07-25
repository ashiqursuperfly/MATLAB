function A = multiLinearReg (x, y)
  n = length(x(:,1));
  
  
  for i = 1 : n+1
    if i == 1
      mat(1,i) = length(x);
    else
      mat(1,i) = sum(x(i-1, :));
      mat(i,1) = mat(1,i);
    end
  endfor
  
  for i=2:n+1
    for j=i:n+1
      sata = sum(x(i-1,:) .* x(j-1,:));
      mat(i, j) = sata;
      mat(j, i) = mat(i, j);
   end
  end 
  
  
  B(1,1) = sum(y);
  for i=2:n+1
    B(i,1) = sum(x(i-1,:) .* y);    
  endfor
  
  A = gauss_jordan(mat, B);
  
  
  
endfunction
