% This function generates a
% Exponential random variable
% pdf is given by : param * exp(-param x)

function exp_rv = func_exp_rv ( param )

cd = rand;
exp_rv = (-1 / param) * log(cd);

end
