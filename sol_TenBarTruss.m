coordinate = [18.28, 9.14; 18.28, 0; 9.14, 9.14;...
    9.14, 0; 0, 9.14; 0, 0];
node = [3, 5; 1, 3; 4, 6; 2, 4; 3, 4;...
    1, 2; 4, 5; 3, 6; 2, 3; 1, 4];
E = 200 * 10^9 * ones(10,1);

r1 = 0.1;
r2 = 0.05;
r = [r1; r1; r1; r1; r1; r1; r2; r2; r2; r2];
A = pi * r.^2;

L = zeros(10,1);
c = zeros(10,1);
s = zeros(10,1);
for z = 1:10
    L(z) = ((coordinate(node(z,1),1) - coordinate(node(z,2),1))^2 +...
        (coordinate(node(z,1),2) - coordinate(node(z,2),2))^2) ^ 0.5;
    c(z) = (coordinate(node(z,2),1) - coordinate(node(z,1),1)) / L(z);
    s(z) = (coordinate(node(z,2),2) - coordinate(node(z,1),2)) / L(z);
end
T = [node,E,A,L,c,s];

K = zeros(12,12);

K = add_element(K, A, E, L, c, s, node)