function newPopulation = InsertBestIndividual(population,bestIndividual,nCopies)

    for i=1:nCopies
         population(i,:) = bestIndividual;
    end
    
    newPopulation = population;
end

