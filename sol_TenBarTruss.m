function [sigma, Q] = sol_TenBarTruss(r1, r2)
% 定義各參數數值
coordinate = [18.28, 9.14; 18.28, 0; 9.14, 9.14;...
    9.14, 0; 0, 9.14; 0, 0]; % 各節點的座標,節點6為原點
node = [3, 5; 1, 3; 4, 6; 2, 4; 3, 4;...
    1, 2; 4, 5; 3, 6; 2, 3; 1, 4]; % 各桿件接觸到的節點編號
E = 200 * 10^9 * ones(10,1); % 楊氏係數

r1 = 0.1;
r2 = 0.05;
r = [r1; r1; r1; r1; r1; r1; r2; r2; r2; r2];
A = pi * r.^2;

L = zeros(10,1);
c = zeros(10,1); % cos
s = zeros(10,1); % sin
for z = 1:10
    L(z) = ((coordinate(node(z,1),1) - coordinate(node(z,2),1))^2 +...
        (coordinate(node(z,1),2) - coordinate(node(z,2),2))^2) ^ 0.5;
    c(z) = (coordinate(node(z,2),1) - coordinate(node(z,1),1)) / L(z);
    s(z) = (coordinate(node(z,2),2) - coordinate(node(z,1),2)) / L(z);
end
T = [node,E,A,L,c,s];

% 開一個空白的剛性矩陣 (stiffness matrix)
K = zeros(12,12);

% 計算 stiffness matrix (可使用 add_element 函數)
K = add_element(K, A, E, L, c, s, node);

% 建立力矩陣
F_matrix = [0; 0; 0; -10^7; 0; 0; 0; -10^7; 0; 0; 0; 0];

% 建立空白位移矩陣
Q = zeros(12,1);

% 計算位移量 (F = KQ)
% 因為node5.6是固定的,所以9~12 = 0
% KQ = F
F = F_matrix(1:8, 1) ;
K_red = K(1:8,1:8);
Q = K_red \ F;
Q(9:12,:) = 0;
% 計算應力 (stress) (可使用 compute_stress 函數)
sigma = compute_stress(Q, E, L, c, s, node);
% 計算反作用力 compute reactions
R = zeros(4,1);
K_rea = K(9:12,:);
R = K_rea * Q;
end









