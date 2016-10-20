function GSH = GraphSphericalHarmonics(l,m)
    theta = linspace(0, pi, 30);
    phi = linspace(0, 2*pi, 30);
    R = zeros(1,30);

    i = 1;
    for w = theta
        Ylm = SpecialHarmonics(l,m,cos(w),0);
        ConjYlmXYlm = vpa(conj(Ylm) * Ylm);
        R(i) = ConjYlmXYlm;
        i = i + 1;
    end

    X = (R .* sin(theta))' * cos(phi);
    Y = (R .* sin(theta))' * sin(phi);
    Z = (R .* cos(theta))' * ones(1,length(phi));
    figure
    str = sprintf('Graph at l = %d, and m = %d', l, m);
    surf(X,Y,Z)
    title(str)
end