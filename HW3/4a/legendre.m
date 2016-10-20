function LP = legendre(l,m,y)
    syms x
    First = (-1)^(m)  /  (2^(l)*factorial(l));
    Second = (1 - (x)^(2))^(m/2);
    Third = ((x)^(2) - 1)^(l);
    Fourth = diff(Third, x, l+m);
    LP = First * Second * Fourth;
    LP = subs(LP,x,y);
end