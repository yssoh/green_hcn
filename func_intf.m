% This function computes the total interference for a given point

% Input:
% xpost, ypost           -> x and y coordinates of location you want
% to compute the interference at
% pp_in                  -> input a PPP (according to the format of ppp_sim
% tpower                 -> transmit power
% alpha_cost             -> alpha

% Output:
% intf                   -> interference (scalar)

function intf = func_intf ( xpost,ypost, pp_in, tpower,alpha_const)

intf = 0;

size_mat = size(pp_in);
noofpoints = size_mat(1,2);

for counter_1 = 1: noofpoints;
    dist = sqrt((pp_in(1,counter_1) - xpost)^2 + (pp_in(2,counter_1) - ypost)^2);
    intf = intf + tpower * dist^(-alpha_const)* func_exp_rv(1);
end;

end