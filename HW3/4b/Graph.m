function G = Graph(l)
    theta = linspace(0,pi,30);
    phi = linspace(0,2*pi,30);
    [theta,phi] = meshgrid(theta,phi);

    N = 4;
    ES = 0;

    Ylme = Ylm(l,0,0);
    ES = ES + Ylme(theta,phi).*Qlm(l,0,N);

    for m = 1:l
        even = Ylm(l,m,0);
        odd = Ylm(l,m,1);
        ES = ES + even(theta,phi)*Qlm(l,m,N) + odd(theta,phi)*Qlm(l,m,N);
    end

    r = ES;

    x = r.*sin(theta).*cos(phi);
    y = r.*sin(theta).*sin(phi);
    z = r.*cos(theta);

    figure()
    surf(x,y,z)
    str = sprintf('Graph at l = %d',l);
    title(str);
end
