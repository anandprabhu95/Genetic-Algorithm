function iSelected = TournamentSelect(fitness, pTournament, tournamentSize)

    populationSize = size(fitness,1);
    iTmp = [];
    
    for i=1:tournamentSize
    iTmp(i) = 1 + fix(rand*populationSize);
    contestantFitness(i) = fitness(iTmp(i));        %Fitness of the contestants
    end
    
    iContestants = iTmp;
    
    
    for i = 1:(tournamentSize-1)
        r = rand;

        if (r < pTournament)
            [~,iMaxFit]  = max(contestantFitness);     %Contestant with max fitness is selected
            iSelected = iContestants(iMaxFit);  
            break;
        else
            if i == (tournamentSize-1)
                [~,iMinFit] = min(contestantFitness);    %Executed only if two contestants are remaining
                iSelected = iContestants(iMinFit);
                break;
            else    
                [~,iMaxFit]   = max(contestantFitness);         %Finds the contestant with max fitness
                iContestants(iMaxFit) = []; %Removes the contestant with max fitness and forms a new index array
                contestantFitness=[];                                                 
                for j=1:length(iContestants)
                    contestantFitness(j)=fitness(iContestants(j));     %Fitness of the remaining contestants
                end
            end
        end
    end
end