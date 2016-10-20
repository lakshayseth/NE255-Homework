function Ylm = Ylm(l,m,N)
    Plm = legendre(l,m);
    if(m == 0)
        Dlm = (-1)^m * sqrt( ((2*l+1)*factorial(l-m)) / (4*pi*factorial(l+m)) );
    else
        Dlm = (-1)^m * sqrt(2* ((2*l+1)*factorial(l-m)) / (4*pi*factorial(l+m)) );
    end
    
    if(N == 0)
        Ylm = @(theta,phi) Dlm.*Plm(cos(theta)).*cos(m.*phi);
    elseif(N == 1)
        Ylm = @(theta,phi) Dlm.*Plm(cos(theta)).*sin(m.*phi);
    else
        print('N has to be 0 for even, N has to be 1 for odd')
    end
    
end