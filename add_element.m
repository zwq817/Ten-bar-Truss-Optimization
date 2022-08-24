function K = add_element(K, A, E, L, theta, node1, node2)
    c = cosd(theta); s = sind(theta);
    k = A*E/L*[c^2, c*s, -c^2, -c*s; c*s, s^2, -c*s, -s^2;...
    -c^2, -c*s, c^2, cs; -c*s, -s^2, c*s, s^2;]
end