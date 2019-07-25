## Copyright (C) 2018 ASUS
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
## @deftypefn {} {@var{retval} =} PowerEquation (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ASUS <ASUS@ASHIQ-103>
## Created: 2018-06-23

function [logX,logY] = PowerEquation (X, Y)
Size=size(X)(2);
logX=zeros(1,Size);
logY=zeros(1,Size);
for i=1: Size
  logX(i)=log10(X(i));
  logY(i)=log10(Y(i));
  end
endfunction
