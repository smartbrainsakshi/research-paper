function [bestPos bestFit Conver] =PSO(IntPop,It,LB,UB,S,Node)
    format long g
    Nvars=size(IntPop,2);
    % Default Parameters
    C1 = 2;% this values affect the localization accuracy
    C2 = 2;%this values affect the localization accuracy
    N = size(IntPop,1);
    W = 0.2;
    beta=0.4;

    % Initial Position and Velocity

    CurrentPosition=IntPop;
    Velocity = W.*rand(N,Nvars) ; % Initial Velocity
    % Evalute Initial Position
    CurrentFitness = zeros(N,1); % Fitness Value
     for it=1:size(CurrentPosition,1)
         temp=CurrentPosition(it,:);    
         temp=CheckLimits(temp,LB,UB,Node);
         CurrentPosition(it,:)=temp;
         CurrentFitness(it,1)=fitness(temp,S) ;                                
     end

    % Update Local Best
    LocalBestPosition = CurrentPosition; % Local Best
    LocalBestFitness = CurrentFitness;
    
    
    % Update Global Best
    [temmp,index]=max(LocalBestFitness);
    if temmp==0
    GlobalBestFitness =0;
    else
    GlobalBestFitness =temmp;
    end    
    GlobalBestPosition = LocalBestPosition(index,:); % Global Best
    % Update Velocity and Position
    R1 =rand(N,Nvars); % random Number 1
    R2 =rand(N,Nvars); % random Number 2

    Velocity = W.*Velocity + C1.*(R1.*(LocalBestPosition-CurrentPosition))...
              + C2.*(R2.*(GlobalBestFitness-CurrentPosition));
    CurrentPosition = CurrentPosition + Velocity ;

    % Iterate to Achive Best
    Iter = 0;
    while (Iter < It)
        Iter = Iter+1;
        %%Evalute Current Position
        for it=1:size(CurrentPosition,1)
         temp=CurrentPosition(it,:);
         temp=CheckLimits(temp,LB,UB,Node);
         CurrentPosition(it,:)=temp;
         CurrentFitness(it,1)=fitness(temp,S);
        end

     % Update Local Best
        indexes = find(CurrentFitness > LocalBestFitness);
        LocalBestFitness(indexes) = CurrentFitness(indexes);
        LocalBestPosition(indexes,:) = CurrentPosition(indexes,:);


    % Update Global Best
        [GlobalBestFitnessNew,index] = max(LocalBestFitness);
        if GlobalBestFitnessNew > GlobalBestFitness  
            GlobalBestFitness = GlobalBestFitnessNew;
            GlobalBestPosition = LocalBestPosition(index,:);
        end
    % Update Velocity and Position
       R1 =rand(N,Nvars); % random Number 1
       R2 =rand(N,Nvars); % random Number 2
       Velocity = W.*Velocity + C1.*(R1.*(LocalBestPosition-CurrentPosition))...
        + C2.*(R2.*(GlobalBestFitness-CurrentPosition));
        CurrentPosition = CurrentPosition + Velocity ;
          
        Conver(Iter)=GlobalBestFitness;
        
%         disp(sprintf('Iteration - %d best fitness - %5.4f',Iter,GlobalBestFitness))
    end
    % Output

    bestPos = round(abs(GlobalBestPosition));
    bestFit = GlobalBestFitness;  
    
  
end