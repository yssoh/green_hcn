% This function is a routine that
% simulates a Poisson Point Process

% Inputs are as follows:
% SIZE X, SIZE Y        -> DIMENSIONS IN METRES
% PPP_INT               -> Intensity / Density of PPP

% Output:
% a 2 x ? matrix where each column is the coordinate of a point in
% the PPP

function ppp_out = ppp_sim (size_x,size_y, ppp_int)
ppp_out = [;];

%I will divide into 100x100m sectors
scale = 100;

for counter_x = 1: (size_x/scale);
for counter_y = 1: (size_y/scale);
    %Number of points
    ppp_noofpts= poi_rv(ppp_int*scale*scale);
    for counter_z = 1 : ppp_noofpts;
        xvar = rand*scale; yvar = rand*scale;
        xyvect = [ (counter_x-1)*scale + xvar; (counter_y-1)*scale + yvar];
        ppp_out = [ppp_out xyvect];
    end;
end;
end;

end
