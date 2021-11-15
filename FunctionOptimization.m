clear;
clc;
populationSize = 100;
numberOfGenes = 50;
crossoverProbability = 0.8;
mutationProbability = 0.02;
tournamentSelectionParameter = 0.75;
variableRange = 10.0;
numberOfGenerations = 100;
fitness = zeros(populationSize,1);
tournamentSize = 2;
nVariables = 2;
nCopies = 1;


population = InitializePopulation(populationSize, numberOfGenes);


for iGeneration = 1:numberOfGenerations
    
    maximumFitness = 0.0;
    xBest = zeros(1,2); 
    bestIndividualIndex = 0;

    for i = 1:populationSize
        chromosome = population(i,:);
        x = DecodeChromosome(chromosome,nVariables, variableRange);
        
        fitness(i) = EvaluateIndividual(x);
        if (fitness(i) > maximumFitness)
            maximumFitness = fitness(i);
            bestIndividualIndex = i;
            xBest = x;
        end
    end


    tempPopulation = population;

    for i = 1:2:populationSize
        i1 = TournamentSelect(fitness,tournamentSelectionParameter,tournamentSize);
        i2 = TournamentSelect(fitness,tournamentSelectionParameter,tournamentSize);

        chromosome1 = population(i1,:);
        chromosome2 = population(i2,:);
            
        r = rand;
        if (r < crossoverProbability)
            newChromosomePair = Cross(chromosome1,chromosome2);
            tempPopulation(i,:) = newChromosomePair(1,:);
            tempPopulation(i+1,:) = newChromosomePair(2,:);
        else
            
            tempPopulation(i,:) = chromosome1;
            tempPopulation(i+1,:) = chromosome2;
        end
    end

    for i = 1:populationSize
        originalChromosome = tempPopulation(i,:);
        mutatedChromosome = Mutate(originalChromosome,mutationProbability);
        tempPopulation(i,:) = mutatedChromosome;
    end
    
    bestIndividual = population(bestIndividualIndex,:);
    population = InsertBestIndividual(tempPopulation,bestIndividual,nCopies);
    

end

functionValue=1/maximumFitness;

% Print final result
format short;
disp('xBest');
disp(xBest);
disp('Function Value');
disp(functionValue);