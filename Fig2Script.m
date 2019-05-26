% This Script plots the Energy Efficiency Ratio, which is defined as the
% Network TP / Network Power Consumption, versus q, which is the fraction
% of MBSes that are awake in the random sleeping policy. The 3 graphs that
% are plotted represent the 3 different values of beta, namely 1,2,5. In
% general, the plots show that energy efficieny decreases with an
% increasing beta.

set_para;

results = zeros(6,6);

for counter_beta = 1:3
    if counter_beta==1
        beta = 1;
    elseif counter_beta==2
        beta = 2;
    else
        beta = 5;
    end;
    
    for counter_1 = 1:6
        q = (counter_1-1)*0.2;
        p_consume = lm*q*(WM0 + WMdel*beta*WM) + lm*(1-q)*WMsleep;
        a0 = thres*sigma2 / PM;
        b0 = beta*q*lm;
        results(counter_beta,counter_1) = (q*lm)^2*func_gseries(pi*b0*(1+rho4(thres)),a0) / p_consume;
        results(counter_beta+3,counter_1) = (q*lm)^2*func_gLB(pi*b0*(1+rho4(thres)),a0) / p_consume;
    end;
    
end;

plot(results(1,:),'-+k','LineWidth',3,'MarkerSize',12);
hold on
plot(results(2,:),':og','LineWidth',3,'MarkerSize',12);
plot(results(3,:),'-.xb','LineWidth',3,'MarkerSize',12);
%plot(results(4,:),'-+k','LineWidth',3,'MarkerSize',12);
%plot(results(5,:),':og','LineWidth',3,'MarkerSize',12);
%plot(results(6,:),'-.xb','LineWidth',3,'MarkerSize',12);
hold off
