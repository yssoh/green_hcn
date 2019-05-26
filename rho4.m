function [ z ] = rho4( x )
%Computes the rho function for our given value of alpha
z = sqrt(x) * (pi/2 - atan(1/sqrt(x)));
end