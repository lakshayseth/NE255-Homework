clc
clear
pi_err = 3.14159;
piRandE1 = 0;
rng('shuffle')
for i = 1:10
    dRand = rand(2,1);
    r = 1/(1+dRand(1,1)^2);
    if dRand(2,1)<r || dRand(2,1)==r
        piRandE1 = piRandE1+1;
    end
end
piRandE1 = 4*piRandE1/10;
errE1 = abs(pi_err-piRandE1)/(pi_err)

piRandE2 = 0;
rng('shuffle')
for i = 1:100
    dRand = rand(2,1);
    r = 1/(1+dRand(1,1)^2);
    if dRand(2,1)<r || dRand(2,1)==r
        piRandE2 = piRandE2+1;
    end
end
piRandE2 = 4*piRandE2/100;
errE2 = abs(pi_err-piRandE2)/(pi_err)

piRandE3 = 0;
rng('shuffle')
for i = 1:1000
    dRand = rand(2,1);
    r = 1/(1+dRand(1,1)^2);
    if dRand(2,1)<r || dRand(2,1)==r
        piRandE3 = piRandE3+1;
    end
end
piRandE3 = 4*piRandE3/1000;
errE3 = abs(pi_err-piRandE3)/(pi_err)

piRandE4 = 0;
rng('shuffle')
for i = 1:10000
    dRand = rand(2,1);
    r = 1/(1+dRand(1,1)^2);
    if dRand(2,1)<r || dRand(2,1)==r
        piRandE4 = piRandE4+1;
    end
end
piRandE4 = 4*piRandE4/10000;
errE4 = abs(pi_err-piRandE4)/(pi_err)