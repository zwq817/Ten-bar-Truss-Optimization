function sigma = compute_stress(Q, E, L, c, s, node)
% 建立空白應力矩陣
sigma = zeros(10,1);
for j = 1:10
    sigma(j) = E(j)./L(j).* [-c(j) -s(j) c(j) s(j)] * [Q(2*node(j,1)-1); Q(2*node(j,1)); Q(2*node(j,2)-1); Q(2*node(j,2))];
end
end