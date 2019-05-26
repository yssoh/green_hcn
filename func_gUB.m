% This subroutine is a upper bound to the function g in the manuscript. It
% is a good approximation as beta/alpha -> infinity

function [ z ] = func_gUB( beta, alpha )

z = 2*pi / ( beta + sqrt(beta^2  + 2*alpha/pi) );

end

