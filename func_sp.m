% This subroutine approximately computes the success probability of a
% transmission from a FAP to a USER via Monte-Carlo. First we provide the
% network. Then we run one instance of a transmission. We consider the
% transmission successful if the signal exceeds the threshold. This routine
% simulates ONE instance of a transmission.

% Input:
% Rec_Loc           -> Location of the receiver user
% Transm_Loc        -> Location of the transmitting FAP
% PPP_INT           -> a (2 x ?) matrix with the coordinates of all
% interferers
% Pm                -> Value of the power 
% alpha             -> alpha
% thresh            -> threshold that defines successful transmission
% sigma2            -> noise

% Output: z         -> binary where 1 incidates success, 0 failure

function [ z ] = func_sp( Rec_Loc, Transm_Loc, PPP_INT, Pm, alpha, thresh, sigma2 )

intf = 0;
RR = sqrt( (Rec_Loc(1,1) - Transm_Loc(1,1))^2 + (Rec_Loc(1,2) - Transm_Loc(1,2))^2 );
intf = intf + func_intf(Rec_Loc(1,1),Rec_Loc(1,2),PPP_INT,Pm,alpha) + sigma2;
SIR = Pm*func_exp_rv(1)*RR^(-alpha)/intf;
if SIR > thresh
    z=1;
else
    z=0;
end;

end

