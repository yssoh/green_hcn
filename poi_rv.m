% This function generates a
% Poisson Random Variable

% Input: Mean
% Output: Poisson Random variable

function poi_out = poi_rv (poi_mean)
    uni_rv = rand;
    counter_1 = 0;
    while uni_rv >0;
        uni_rv = uni_rv - (exp(-poi_mean)* (poi_mean^counter_1) / factorial(counter_1));
        counter_1=counter_1 + 1;
    end;
    poi_out = counter_1 - 1;
end