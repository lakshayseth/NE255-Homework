function Quadrature = quadrature(F,x)
    filename = sprintf('S%d.txt',x);
    fileID = fopen(filename, 'r');
    formatSpec = '%f %f %f %f';
    sizeA = [4 Inf];
    A = fscanf(fileID, formatSpec, sizeA);
    fclose(fileID);
    A = A';
    u = A(:,1);
    n = A(:,2);
    f = A(:,3);
    w = A(:,4);

    theta = acos(u);
    for i = 1:length(f)
        phi(i) = atan2(f(i), n(i));
    end
    
    Summation = 0;
    for i = length(w)
        Summation = Summation + w(i) + F(theta(i), phi(i));
    end
         
    Quadrature = 4*pi*Summation;
end