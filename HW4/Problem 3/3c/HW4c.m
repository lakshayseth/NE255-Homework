clc;
clear;
alpha = 0.5;
mu = 0.2;
Sigma_T = 1;
Sigma_S = 0.9;
Qe = 1;
delta = .2;

x_i = 0;
x_f = 2;
n = (x_f-x_i)/delta;

x_forward = linspace(x_i,x_f,n);

Psi_half = zeros(1,n);
Psi_half(1) = 2;

Psi = zeros(1,n);
S = zeros(1,n);
S_prev = zeros(1,n);
Psi_reverse = zeros(1,n);

RelativeError = 1;

while RelativeError > 1e-4
    
    for i = 1:length(Psi)
        S(i) = Sigma_S * Psi(i) + Qe;
        Psi(i) = ( S(i) + (2*abs(mu)*Psi_half(i))/((1+alpha)*delta) ) / ( Sigma_T + ( (2*abs(mu)) / ((1+alpha)*delta) ) );
        Psi_half(i+1) = ( (2*Psi(i)) / (1+alpha) ) - ( ( (1-alpha)/(1+alpha) ) * Psi_half(i));
    end
    
    Psi_half_reverse = fliplr(Psi_half);    
    S_reverse = fliplr(S);
    
    for i = 1:length(Psi_reverse)
        S_reverse(i) = Sigma_S * Psi_reverse(i) + Qe;
        Psi_reverse(i) = ( S_reverse(i) + (2*abs(mu)*Psi_half_reverse(i))/((1-alpha)*delta) ) / ( Sigma_T + ( (2*abs(mu)) / ((1-alpha)*delta) ) );
        Psi_half_reverse(i+1) = ( (2*Psi_reverse(i)) / (1-alpha) ) - ( ( (1+alpha)/(1-alpha) ) * Psi_half_reverse(i));
    end
    
    
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
Psi = Psi + Psi_reverse;
figure
plot(x_forward, Psi)
str = sprintf('Graph at \\Delta %f and \\alpha %f', delta, alpha);
grid on
title(str);
