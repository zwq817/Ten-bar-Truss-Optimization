function [Sigma, Sigmaeq] = nonlcon(r)
sigmay = 250 * 10^6; % 降伏應力
[sigma, Q] = sol_TenBarTruss(r(1), r(2));

% 各桿件應力的絕對值小於等於降伏應力
for i = 1:10
    Sigma(i) = abs(sigma(i)) - sigmay;
end

% 節點2的位移小於等於0.02
Sigma(11) = ((Q(3))^2 + (Q(4))^2)^0.5 - 0.02;

Sigmaeq = [];
