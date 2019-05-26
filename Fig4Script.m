% This plots the EE metric = Network TP / Network PC vs fraction of network
% still awake (ie q) for Random sleeping (the worst case)
% Strategic sleeping (intermediate)
% No noise case (upper bound), random sleeping
% All the graphs start from 0. Note that there is no throughput when the
% entire network is shut down

% The Strategic Sleeping scheme is as follows: Activity is characterized by
% having q on, (1-q) off. The strategic sleeping case (I think) always 
% provides a better energy efficiency metric than random sleeping.

set_para;
results = zeros(3,11);

for counter_1 = 1:11;
    q = (counter_1 - 1)*0.1;
    a0 = thres*sigma2 / PM;
    
    %No sleeping case
    p_consume = lm*(WM0 + WMdel*WM);
    results(1,counter_1) = lm*lm*func_gseries(pi*lm*(1+rho4(thres)),a0/10) / p_consume;
    
    %Random Sleeping
    p_consume = lm*q*(WM0 + WMdel*WM) + lm*(1-q)*WMsleep;
    results(2,counter_1) = q*lm*q*lm*func_gseries(pi*lm*q*(1+rho4(thres)),a0/10) / p_consume;

    %Strategic Sleeping
    p_consume = lm*q*(WM0 + WMdel*WM) + lm*(1-q)*WMsleep;
    results(3,counter_1) = q*lm*lm*func_gseries(pi*lm*(1+q*rho4(thres)),a0/10) / p_consume;
    
    %No noise case
    results(4,counter_1) = q*lm/((1+rho4(thres)) * p_consume);
    
end;

plot(results(2,:),':og','LineWidth',3,'MarkerSize',12);
hold on
plot(results(3,:),'-.xb','LineWidth',3,'MarkerSize',12);
plot(results(4,:),'-.+k','LineWidth',3,'MarkerSize',12);
hold off
