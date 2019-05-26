function [ ASSIGNLIST, ASSIGNTYPE, MBSCOUNTER, FAPCOUNTER ] = func_FAPassign( PPP_MBS, PPP_FAP, kap, PPP_USERS )
%Assign the MBSs and FAPs to all the users according to the following
%policy:
%Connect to FAP if
%FAPdist < kap* MBSdist
%connect to MBS otherwise

size_mat = size(PPP_USERS);
noofUSERS = size_mat(1,2);
size_mat = size(PPP_FAP);
noofFAP = size_mat(1,2);
size_mat = size(PPP_MBS);
noofMBS = size_mat(1,2);

ASSIGNTYPE = zeros(1, noofUSERS);
ASSIGNLIST = zeros(1, noofUSERS);
FAPCOUNTER = zeros(1, noofFAP);
MBSCOUNTER = zeros(1, noofMBS);

if (noofMBS > 0) && (noofFAP > 0) %Error checking mechanism

    for counter_1 = 1:noofUSERS;
        %Compute distances to all MBS
        MBSdist = (PPP_USERS(1,counter_1) - PPP_MBS(1,1))^2 + (PPP_USERS(2,counter_1) - PPP_MBS(2,1))^2;
        MBS_index = 1;
        for counter_2 = 2: noofMBS;
            newdist = (PPP_USERS(1,counter_1) - PPP_MBS(1,counter_2))^2 + (PPP_USERS(2,counter_1) - PPP_MBS(2,counter_2))^2;
            if newdist < MBSdist
                MBSdist = newdist;
                MBS_index = counter_2;
            end;
        end;
        
        %Compute distances to all FAP
        FAPdist = (PPP_USERS(1,counter_1) - PPP_FAP(1,1))^2 + (PPP_USERS(2,counter_1) - PPP_FAP(2,1))^2;
        FAP_index = 1;
        for counter_2 = 2: noofFAP;
            newdist = (PPP_USERS(1,counter_1) - PPP_FAP(1,counter_2))^2 + (PPP_USERS(2,counter_1) - PPP_FAP(2,counter_2))^2;
            if newdist < FAPdist
                FAPdist = newdist;
                FAP_index = counter_2;
            end;
        end;
        
        %Implement the FAP and MBS connect policy
        if FAPdist < kap* MBSdist
            ASSIGNTYPE(1,counter_1) = 2;
            ASSIGNLIST(1,counter_1) = FAP_index;
            FAPCOUNTER(1,FAP_index) = FAPCOUNTER(1,FAP_index)+1;
        else
            ASSIGNTYPE(1,counter_1) = 1;
            ASSIGNLIST(1,counter_1) = MBS_index;
            MBSCOUNTER(1,MBS_index) = MBSCOUNTER(1,MBS_index)+1;
        end;

    end;

else
    fprintf('ERROR! No MBSs or No FAPs. Increase Grid size.');
end;

end

