clc;
clear;
alphas = [-0.5,0,0.5];
alphas = 0;
mu = [0.2,0.7];
mu = 0.7;
Qe = 1;
Sigma_T = 1;
Sigma_S = 0.5;
Sigma_S = 0.5;
deltas = [0.08,0.1,0.125,0.2,0.4];
deltas = 0.2;
x_i = 0;
x_f = 2;
IC1 = 2;
for u = mu
    for alpha = alphas
        for delta = deltas
            n = (x_f-x_i)/delta;
            x = linspace(x_i,x_f,n);
            for i = 1:n
                Qin(i) = (2*i + 1) * Sigma_S * IC1 + Qe;
                Flux_IN(i) = (1+delta*Sigma_T/(2*u))^(-1)*(IC1+delta*Qin(i)/(2*u));
                Flux_P(i) = (2/(1+alpha))*Flux_IN(i)-((1-alpha)/(1+alpha))*IC1;
                IC1 = Flux_P(i);
            end
            IC2 = IC1;
            for j = n:-1:1
                Qout(j) = (2*j + 1) * Sigma_S*IC1 + Qe;
                Flux_OUT(j) = (1+delta*Sigma_T/(2*abs(u)))^(-1)*(IC2+delta*Qout(j)/(2*u));
                Flux_M(j) = 2/(1+alpha)*Flux_OUT(j)-(1-alpha)/(1+alpha)*IC2;
                IC2 = Flux_M(j);
            end
            SourceHolder = 0.5*(Qin+Qout);
            ScalarFlux = 0.5*(Flux_IN + Flux_OUT);
            fig = figure
            plot(ScalarFlux)
            str = sprintf('Graph at Mesh Spacing %f, \\alpha %f, \\mu %f', delta, alpha, u);
            grid on
            title(str);
            N = 3;
            MS = fix(rem(delta,1)*10^N);
            A = fix(rem(alpha,1)*10^N);
            U = fix(rem(u,1)*10^N);
            %fname = sprintf('MS %d A %d U %d.jpg', MS, A, U);
            %saveas(fig,fname)
        end
    end
end
