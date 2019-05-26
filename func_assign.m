% This subroutine takes in two arguments where the first should be the 
% coordinates of the locations of the macro-base stations, the second
% the coordinates of the users. This subroutine then assigns the MBS
% that is nearest to each user to that user.

% Input:
% PPP_MBS        -> coordinates of MBS (2 x ? ) matrix
% PPP_USERS      -> coordinates of USERS (2 x ? ) matrix
% Output:
% A row vector consisting of the assignment

function [ z , y ] = func_assign( PPP_MBS, PPP_USERS )

mat_size = size(PPP_MBS);
noofMBS = mat_size(1,2);
mat_size = size(PPP_USERS);
noofUSERS = mat_size(1,2);

z = zeros(1,noofUSERS);
y = zeros(1,noofMBS);

if noofMBS > 0 %Error checking mechanism
    for counter_1 = 1: noofUSERS;
        %Assign the MBS to the user
        dist = (PPP_USERS(1,counter_1) - PPP_MBS(1,1))^2 + (PPP_USERS(2,counter_1) - PPP_MBS(2,1))^2;
        MBS_index = 1;
        
        for counter_2 = 2: noofMBS;
            newdist = (PPP_USERS(1,counter_1) - PPP_MBS(1,counter_2))^2 + (PPP_USERS(2,counter_1) - PPP_MBS(2,counter_2))^2;
            if newdist < dist
                dist = newdist;
                MBS_index = counter_2;
            end;
        end;
        
        z(1,counter_1) = MBS_index;
        y(1,MBS_index) = y(1,MBS_index)+1;
    end;
else
    fprintf('ERROR! No MBSes. Increase Grid size.');
end;

end

