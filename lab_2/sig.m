function x = sig(a)
%Return sign of a number
%   Detailed explanation goes here
if(a==0)
    x=0; 
    fprintf('\n Input uguale a zero!\n')
elseif(a<0)
    x=-1;
else
    x=1;
end
end