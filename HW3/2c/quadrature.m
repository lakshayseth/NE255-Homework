function Quadrature = quadrature(x)
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

    Summation = w .* sqrt( u.^2 + n.^2 + f.^2 );
    Quadrature = 4*pi*sum(Summation)
end