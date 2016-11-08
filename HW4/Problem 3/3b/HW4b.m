clc; 
clear;
mesh_spacing = [0.08,0.1,0.125,0.2,0.4];
%mesh_spacing = 0.125;
for delta = mesh_spacing
    x_i = 0;
    x_f = 2;
    n = (x_f-x_i)/delta
    x1 = linspace(x_i,x_f,n);
    x2 = linspace(x_f,x_i,n);
    alphas = [-0.9,-0.5,0.25,0.5,0.9];
    u_n = 0.1;
    Sigma_T = 1;


    for alpha = alphas
        Psi_half = zeros(1,n);
        Psi_half(1) = 2;
        j = 1;
        for i = j:length(Psi_half)
            Psi1(i) = ((2 * u_n * Psi_half(i)) / (delta * (1+alpha))) / (Sigma_T + ( (2*u_n) / ((1+alpha)*delta)) );
            Psi_half(i+1) = ((2*Psi1(i))/(1+alpha)) - (((1-alpha)/(1+alpha))*Psi_half(i));
        end
        initial = Psi_half(end);
        Psi_half = zeros(1,n);
        Psi_half(1) = initial;
        j = 1;
        for i=j:length(Psi_half)
            Psi2(i) = ((2 * u_n * Psi_half(i)) / delta) / (Sigma_T + ( (2*u_n) / delta) );
            Psi_half(i+1) = (2*Psi2(i)) - Psi_half(i);
        end
        Psi = Psi1+Psi2;
        figure
        plot(x1, Psi)
        str = sprintf('Graph at Mesh Spacing %f and \\alpha %f', delta, alpha);
        grid on
        title(str);
    end
    clear;
end


