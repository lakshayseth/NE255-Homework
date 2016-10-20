function LP = legendre(l,m)
    FS = @(x) (((-1)^m)/((2^l)*factorial(l)))*(1-x.^2).^(m/2);
    syms x
    f(x) = (x.^2-1).^l;
    Third(x) = diff(f,x,l+m);
    Third = matlabFunction(Third);
    LP = @(x) FS(x).*Third(x);
end