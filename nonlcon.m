function [Sigma, Sigmaeq] = nonlcon(r)
sigmay = 250 * 10^6; % �������O
[sigma, Q] = sol_TenBarTruss(r(1), r(2));

% �U������O������Ȥp�󵥩󭰥����O
for i = 1:10
    Sigma(i) = abs(sigma(i)) - sigmay;
end

% �`�I2���첾�p�󵥩�0.02
Sigma(11) = ((Q(3))^2 + (Q(4))^2)^0.5 - 0.02;

Sigmaeq = [];
