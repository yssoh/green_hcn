%This function returns the index of the nearest point, that is, 

function assign_index = func_asgn ( xvar, yvar, pp_in)

size_mat = size(pp_in);
noofpoints = size_mat(1,2);

dist = (pp_in(1,1) - xvar)^2 + (pp_in(2,1) - yvar)^2;
assign_index = 1;

for counter_1 = 2:noofpoints;
    newdist = (pp_in(1,counter_1) - xvar)^2 + (pp_in(2,counter_1) - yvar)^2;
    if newdist < dist;
        assign_index = counter_1;
        dist = newdist;
    end;
end;

end