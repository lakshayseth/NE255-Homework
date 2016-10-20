function Slm = Slm(l,m,N)
    Plm = legendre(l,m);
    if(m == 0)
        Dlm = (-1)^m * sqrt( ((2*l+1)*factorial(l-m)) / (4*pi*factorial(l+m)) );
    else
        Dlm = (-1)^m * sqrt(2* ((2*l+1)*factorial(l-m)) / (4*pi*factorial(l+m)) );
    end
    q = 1;
    IntegralTerm = @(theta, phi) Dlm.*Plm(cos(theta)).*sin(m.*phi).*q;
    Slm = quadrature(IntegralTerm, N);
end
