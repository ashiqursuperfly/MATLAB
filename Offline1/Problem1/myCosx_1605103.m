function outvar=myCosx_1605103(x,numberOfTerms)
   %This Function Approximates the value of cosx using taylor series
   value=0;
   j=0;
   for i=0:numberOfTerms-1 
   if(rem(i,2)==0)
   value=value + ((power(x,j))/(factorial(j)));
   j=j+2;
  % printf("EVEN %d %d",i,j);
   else 
   value= value - ((power(x,j))/(factorial(j)));
   j=j+2;
   % printf("ODDD %d %d",i,j);
   endif
   endfor
   outvar=value 
   endfunction