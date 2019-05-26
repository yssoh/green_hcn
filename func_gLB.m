% This subroutine is a lower bound to the function g in the manuscript. It
% is a good approximation as beta/alpha -> infinity

function [ z ] = func_gLB( beta, alpha )

z = 2*pi / ( beta + sqrt(beta^2 + 8*alpha) );

end

