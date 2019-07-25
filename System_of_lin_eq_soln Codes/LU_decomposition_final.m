## Copyright (C) 2018 Resource
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} LU_decomposition_final (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Resource <Resource@RESOURCE-PC>
## Created: 2018-05-24

function [X] = LU_decomposition_final (A,B)
  %%LU decomposition
  n=size(A)(1);
  L=zeros(n,n);
 for i= 1 : n
   L(i,i)=1;
   for j = 1 : i-1
     prev_row=A(j,:);
     pres_row=A(i,:);
     mul=pres_row(j);
     div=prev_row(j);
     A(i,:)=pres_row-((mul/div)*prev_row);
     L(i,j)=(mul/div);
   end
 end
 U=A;
 %%Forward elimination
 Y=zeros(n,1);
 Y(1,1) = B(1);
 for i = 2 : n
   sum=0;
   for j = 1 : i-1 
     sum=sum+(L(i,j)*Y(j,1));
   end
   Y(i,1) = B(i)- sum;
  end
 %%Backward substitutuion
 X=zeros(n,1);
 X(n)=Y(n,1)/U(n,n);
 for i = n-1 : -1 : 1
   sum=0;
   for j=i+1 : n
     sum=sum+(U(i,j)*X(j));
   end
   X(i)=(Y(i,1)-sum)*1.0/U(i,i);
 end
 X
endfunction
