function f = obj(r)
dens = 7860;
f = pi * dens .* ((r(1).^2) .* 9.14 .* 6 + (r(2).^2) .* (9.14^2 + 9.14^2)^0.5 .* 4);
end
