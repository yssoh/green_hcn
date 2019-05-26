% This Script computes the values of the success probability via a
% Monte-Carlo simulation (See Fig 1 in the manuscript)

% Each instance of this script will produce an estimate of the success
% probability in PASS.
% To replicate the graph, you need to
% - Let thresh = 0.1, 1/sqrt(10), 1, sqrt(10), 10
% - Repeat between both types of sleeping strategies
% To toggle between the strategies, see further instructions below

alpha_const = 4;
noise = 0.0;
thres = sqrt(10);
PASS = 0; % PASS counts the number of successes
PASS1 = 0;
lm = 0.0002;
activity_SUM = 0;

%Number of repeats
for counter_SIM = 1:2000
    PASS1 = 0;
    
    %Units are in metres, simulating over a 5km block
    MBS = ppp_sim(5000,5000,lm);
    
    %Assign the activity vector
    size_mat = size(MBS);
    MBS_number = size_mat(1,2);
    MBS_activity = zeros(2,MBS_number);

    % There are two blocks of code in the following. Comment out either
    % block.
    
    % For uniform activity
    % Uncomment the following block
    
    %Uniform activity RV
    for counter_MBSact = 1:MBS_number
        MBS_activity(1,counter_MBSact) = rand;
        if MBS_activity(1,counter_MBSact)>rand
            MBS_activity(2,counter_MBSact) = 1;
        else
            MBS_activity(2,counter_MBSact) = 0;
        end;
    end;
    
    % For Binary, 50/50
    % Uncomment the following block
    
    % Binary Activity
    %for counter_MBSact = 1:MBS_number;
    %    MBS_activity(1,counter_MBSact) = rand;
    %    if MBS_activity(1,counter_MBSact)>0.5;
    %        MBS_activity(1,counter_MBSact) = 1;
    %        MBS_activity(2,counter_MBSact) = 1;
    %    else
    %        MBS_activity(2,counter_MBSact) = 0;
    %        MBS_activity(1,counter_MBSact) = 0;
    %    end;
    %end;
    
    % END OF BLOCKS %%%
   
    %Take care of the weighted SINR
    nearest_index = func_asgn(2500,2500,MBS);
    activity_typ = MBS_activity(1,nearest_index);
    activity_SUM = activity_SUM + activity_typ;
    
    %Thin the network
    nodeleted = 0;
    for counter_MBSact = 1:MBS_number
        if MBS_activity(2,counter_MBSact)==0
            MBS(:,counter_MBSact - nodeleted) = [];
            nodeleted = nodeleted+1;
        end;
    end;
    
    %Reassign the nearest network
    nearest_index = func_asgn(2500,2500,MBS);
    dist = sqrt((MBS(1,nearest_index)-2500)^2 + (MBS(2,nearest_index)-2500)^2);
    MBS(:,nearest_index) = [];
    
    for counter_SIR = 1:100
        intf = 0;
        intf = intf + func_intf(2500,2500,MBS,10^(4.3),alpha_const);
        
        %Compute SINR
        SINR = (10^(4.3) * func_exp_rv(1) * dist^(-alpha_const)) / (intf + noise);
        if SINR > thres
            PASS1 = PASS1 + 1;
        end;
        
    end;
    PASS =PASS + PASS1 * activity_typ * (1/100);
    
end;

PASS = PASS / activity_SUM;