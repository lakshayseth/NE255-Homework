function SH = SpecialHarmonics(l,m,x,phi)
    First = (-1).^(m);
    Second = sqrt( ((2*l + 1)*factorial(l-m)) / (4*pi*factorial(l+m)) );
    Third = legendre(l,m,x);
    Fourth = exp(i*m*phi);
    SH = First * Second * Third * Fourth;
end