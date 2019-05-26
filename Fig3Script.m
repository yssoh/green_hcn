% This Script plots Success Probability vs Noise
% Noise is in log scale, from 0.01 * default value to default value
% There are 3 plots: No Sleeping, Random Sleeping, Strategic Sleeping
% For Strategic Sleeping, the activity profile is chosen to be 0.5 with 
% activity 1, 0.5 with activity 0

% Other profiles may be incorporated into this code. In general, whenever
% noise is present, Strategic Sleeping will fare worse than no Sleeping but
% beats Random Sleeping (in terms of success probability).

set_para;
results = zeros(6,9);
sigma2_ref = sigma2;

for counter_1 = 1:9
    sigma2 = sigma2_ref*10^((counter_1-9)*0.5);
    %No sleeping case
    a0 = thres*sigma2 / PM;
    results(1,counter_1) = lm*func_gUB(pi*lm*(1+rho4(thres)),a0);
    results(4,counter_1) = lm*func_gLB(pi*lm*(1+rho4(thres)),a0);
    
    %Random Sleeping
    q=0.5;
    results(2,counter_1) = q*lm*func_gUB(pi*lm*q*(1+rho4(thres)),a0);
    results(5,counter_1) = q*lm*func_gLB(pi*lm*q*(1+rho4(thres)),a0);
    
    %Strategic sleeping
    results(3,counter_1) = lm*func_gUB(pi*lm*(1+0.5*rho4(thres)),a0);
    results(6,counter_1) = lm*func_gLB(pi*lm*(1+0.5*rho4(thres)),a0);
end;

%plot(results(1,:),'-+k','LineWidth',3,'MarkerSize',12);
hold on
%plot(results(2,:),':og','LineWidth',3,'MarkerSize',12);
%plot(results(3,:),'-.xb','LineWidth',3,'MarkerSize',12);
plot(results(4,:),'-+k','LineWidth',5,'MarkerSize',12);
plot(results(5,:),':og','LineWidth',5,'MarkerSize',12);
plot(results(6,:),'-.xb','LineWidth',5,'MarkerSize',12);
hold off
