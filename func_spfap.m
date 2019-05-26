% This subroutine approximately computes the success probability of a
% transmission from a FAP to a USER via Monte-Carlo. First we provide the
% network. Then we run one instance of a transmission. We consider the
% transmission successful if the signal exceeds the threshold. This routine
% simulates ONE instance of a transmission.

% Input:
% Rec_Loc           -> Location of the receiver user
% Transm_Loc        -> Location of the transmitting FAP
% PPP_MBSminus1     -> a (2 x ?) matrix with the coordinates of all MBS
% EXCLUDING the specialized MBS
% PPP_FAPminus1     -> a (2 x ?) matrix with the coordinates of all FAPs
% EXCLUDING the transmitting FAP
% Pm, Pf            -> Values of the power 
% alpha             -> alpha
% thresh            -> threshold that defines successful transmission
% sigma2            -> noise

% Output: z         -> binary where 1 incidates success, 0 failure

function [ z ] = func_spfap( Rec_Loc, Transm_Loc, PPP_MBSminus1, PPP_FAPminus1, Pm, Pf, alpha, thresh, sigma2 )

RR = sqrt( (Rec_Loc(1,1) - Transm_Loc(1,1))^2 + (Rec_Loc(1,2) - Transm_Loc(1,2))^2 );
intf = func_intf(Rec_Loc(1,1),Rec_Loc(1,2),PPP_MBSminus1,Pm,alpha) + sigma2;
intf = intf + func_intf(Rec_Loc(1,1),Rec_Loc(1,2),PPP_FAPminus1,Pf,alpha);
SIR = Pm*func_exp_rv(1)*RR^(-alpha)/intf;
if SIR > thresh
    z=1;
else
    z=0;
end;

end

