clc;
clear;

% Worked with Mitch N, Mario O, Caroline H

l = [0 1 2];
for angmom = l
    m = [0:angmom];
    for quannum = m
        GraphSphericalHarmonics(angmom,quannum)
    end
end

% GraphSphericalHarmonics(0,0)
