function [X] = Gauss_seidel_final (A,B,init_assum,tol,max_itr)
  RelAppErr=[];
  X=init_assum;
  n=size(A)(1);
  error=inf(n,1);
  itr=1;
  prev=X;
 while itr<max_itr
  for i= 1:n %for Each Variable
    sum=0;
    for j= 1 : n %calculate sum using assumed values of y,z when calculating x |i.e ax=d-(sum) -> sum=(by+cz)
      if j~=i
        sum=sum+A(i,j)*X(j);
      end
    end
    X(i)=(B(i)-sum)/A(i,i);
  end
    
    for i= 1: n
      error(i)=(X(i)-prev(i))*100/X(i);
      prev(i)=X(i); 
    end
    itr++;
    RelAppErr=cat(1,RelAppErr,error(1)+error(2)+error(3));  
      
   if  error(1)<tol
     break;
   end
   
 end
 X
 itr
 %size(RelAppErr)
 I=1:itr-1
 plot(I,RelAppErr);
 hold on
 endfunction
