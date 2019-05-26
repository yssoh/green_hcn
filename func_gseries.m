% This computes G via a Taylor series expansion

function [ z ] = func_gseries( beta, alpha )

Y = beta / 2*sqrt(alpha);
erfcY = 1- (2/sqrt(pi))* ( Y - Y^3 / 3 + Y^5 /10 - Y^7 / 42 + Y^9 / 216 - Y^11 / 1320 + Y^13 / 9360);
z = (pi^(3/2) / sqrt(alpha)) * exp( beta^2 / 4*alpha) * (1/2) * erfcY;

end

