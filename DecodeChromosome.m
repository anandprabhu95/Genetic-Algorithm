function x = DecodeChromosome(chromosome,nVariables,variableRange)

    m = size(chromosome,2);
    nBits = fix(m/nVariables);

    x(1) = 0.0;
    for j = 1:nBits
        x(1) = x(1) + chromosome(j)*2^(-j);
    end
    x(1) = -variableRange + 2*variableRange*x(1)/(1-2^(-nBits));
 
    x(2) = 0.0;
    for j = 1:nBits
        x(2) = x(2) + chromosome(j+nBits)*2^(-j);
    end
    x(2) = -variableRange + 2*variableRange*x(2)/(1-2^(-nBits));

end