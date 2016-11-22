%Lakshay Seth
% HW5 Problem 2
%Collaborated with Adam G, Ethan B, Caroline H
clc;
clear;
alpha = 0.5;
%mu = [0.2 -0.2  0.5 -0.5 0.7 -0.7];
mu = 0.2;
Sigma_T = [0.5 0.8 1.0];
Sigma_S = [0.1 0 0; 0.3 0.1 0.1; 0.1 0.3 0.3];
Qe = [1.5 0 0.2];
delta = 0.1;

x_i = 0;
x_f = 2;
n = (x_f-x_i)/delta;
x_forward = linspace(x_i,x_f,n);

Psi_half = zeros(1,n);

Psi = zeros(1,n);
Psi_reverse = zeros(1,n);
S = zeros(1,n);
S_prev = zeros(1,n);

RelativeError = 1;
figure ;
colors = 'rgb';
hold on
for G = 1:3
    %Inital condition is 0.5 for Group 1, and 0 everywhere else
    if G == 1
        Psi_half(1) = 0.5;
    else
        Psi_half(1) = 0;
    end
    for G_prime = 1:3
        while RelativeError > 1e-4
            %Forward Sweep
            for i = 1:length(Psi)
                S(i) = Sigma_S(G,G_prime) * Psi(i) + Qe(G_prime);
                Psi(i) = ( S(i) + (2*abs(mu)*Psi_half(i))/((1+alpha)*delta) ) / ( Sigma_T(G) + ( (2*abs(mu)) / ((1+alpha)*delta) ) );
                Psi_half(i+1) = ( (2*Psi(i)) / (1+alpha) ) - ( ( (1-alpha)/(1+alpha) ) * Psi_half(i));      
            end
            %Reverse Sweep
            Psi_half_reverse = fliplr(Psi_half);    
            S_reverse = fliplr(S);
            for i = 1:length(Psi_reverse)
                S_reverse(i) = Sigma_S(G,G_prime) * Psi_reverse(i) + Qe(G_prime);
                Psi_reverse(i) = ( S_reverse(i) + (2*abs(mu)*Psi_half_reverse(i))/((1-alpha)*delta) ) / ( Sigma_T(G) + ( (2*abs(mu)) / ((1-alpha)*delta) ) );
                Psi_half_reverse(i+1) = ( (2*Psi_reverse(i)) / (1-alpha) ) - ( ( (1+alpha)/(1-alpha) ) * Psi_half_reverse(i));
            end
            
            %Norm 2 to find Relative Error
            Diff = abs(S_prev - S);
            AE = 0;
            for i = 1:length(Diff)
                AE = AE + (Diff(i))^2;
            end
            AbsoluteError = sqrt(AE);
            Denominator = 0;
            for i = 1:length(S)
                Denominator = Denominator + (S(i))^2;
            end
            Den = sqrt(Denominator);
            RelativeError = AbsoluteError/Denominator;
            S_prev = S;
        end
    end
    %Graph for each group
    Psi = Psi + Psi_reverse;
    plot(x_forward, Psi)
    grid on
end
hold off;
str = sprintf('Scalar Flux \\phi as a function of x');
title(str);
ylab = sprintf('Scalar Flux \\phi');
ylabel(ylab);
xlabel('x');
legend({'Group 1','Group 2','Group 3'}) ;