function K = add_element(K, A, E, L, c, s, node)
    
    % 把算出來的值加到剛性矩陣的大矩陣內
    for i = 1:10
        temp = A(i).*E(i)./L(i).*[c(i).^2 c(i).*s(i); c(i).*s(i) s(i).^2];
        K((2*node(i,1)-1):(2*node(i,1)), (2*node(i,1)-1):(2*node(i,1)))...
            = K((2*node(i,1)-1):(2*node(i,1)), (2*node(i,1)-1):(2*node(i,1))) + temp;
        K((2*node(i,2)-1):(2*node(i,2)), (2*node(i,2)-1):(2*node(i,2)))...
            = K((2*node(i,2)-1):(2*node(i,2)), (2*node(i,2)-1):(2*node(i,2))) + temp;
        K((2*node(i,1)-1):(2*node(i,1)), (2*node(i,2)-1):(2*node(i,2)))...
            = K((2*node(i,1)-1):(2*node(i,1)), (2*node(i,2)-1):(2*node(i,2))) - temp;
        K((2*node(i,2)-1):(2*node(i,2)), (2*node(i,1)-1):(2*node(i,1)))...
            = K((2*node(i,2)-1):(2*node(i,2)), (2*node(i,1)-1):(2*node(i,1))) - temp;
    end
end