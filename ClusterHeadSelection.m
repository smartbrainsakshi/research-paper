clc
close all
clear 

ChSelection=newfis('CHSelection');

ChSelection = addvar(ChSelection,'input','Residual Energy',[0 1]);
ChSelection=  addmf(ChSelection,'input',1,'VL','trimf',[-0.4 0 0.1019]);
ChSelection = addmf(ChSelection,'input',1,'L','trimf', [0.0648 0.2262 0.401]);
ChSelection = addmf(ChSelection,'input',1,'M','trimf',[0.3003 0.5 0.639]);
ChSelection = addmf(ChSelection,'input',1,'H','trimf', [0.554 0.7235 0.901]);
ChSelection = addmf(ChSelection,'input',1,'VH','trapmf',[0.792 0.9193 1.02 1.23]);

ChSelection = addvar(ChSelection,'input','Cost',[0 1]);
ChSelection=  addmf(ChSelection,'input',2,'Low','gaussmf',[0.212 0.06614]);
ChSelection = addmf(ChSelection,'input',2,'Medium','gbellmf', [0.165 6.49 0.511]);
ChSelection = addmf(ChSelection,'input',2,'High','gaussmf',[0.1331 0.994]);


ChSelection = addvar(ChSelection,'input','D2BS',[0 1]);
ChSelection=  addmf(ChSelection,'input',3,'Low','trimf',[-0.4 0 0.4]);
ChSelection = addmf(ChSelection,'input',3,'Medium','trimf', [0.1 0.5 0.9]);
ChSelection = addmf(ChSelection,'input',3,'High','trimf',[0.6 1 1.4]);


ChSelection = addvar(ChSelection,'output','Possibility',[0 1]);
ChSelection=  addmf(ChSelection,'output',1,'VL','trimf',[-0.4 0 0.1019]);
ChSelection = addmf(ChSelection,'output',1,'L','trimf', [0.0648 0.2262 0.401]);
ChSelection = addmf(ChSelection,'output',1,'M','trimf',[0.3003 0.5 0.639]);
ChSelection = addmf(ChSelection,'output',1,'H','trimf', [0.554 0.7235 0.901]);
ChSelection = addmf(ChSelection,'output',1,'VH','trapmf',[0.792 0.9193 1.02 1.23]);


showfis(ChSelection)




RuleList=[1 1 1  1   1 1;
          1 1 2  1   1 1;
          1 1 3  1   1 1;
          1 2 1  1   1 1;
          1 2 2  1   1 1;
          1 2 3  1   1 1;
          1 3 1  1   1 1;
          1 3 2  1   1 1;
          1 3 3  1   1 1;   
          
          2 1 1  2   1 1 ;
          2 1 2  1   1 1 ;
          2 1 3  1   1 1 ;          
          2 2 1  2   1 1 ;
          2 2 2  1   1 1 ;
          2 2 3  1   1 1 ;          
          2 3 1  1   1 1 ;
          2 3 2  1   1 1 ;
          2 3 3  1   1 1 ;
          
          
          
          3 1 1  4   1 1 ;
          3 1 2  3   1 1 ;
          3 1 3  3   1 1 ;
          3 2 1  3   1 1 ;
          3 2 2  2   1 1 ;
          3 2 3  2   1 1 ;
          3 3 1  2   1 1 ;
          3 3 2  2   1 1 ;
          3 3 3  2   1 1 ;
          
          
          4 1 1  5   1 1 ;
          4 1 2  4   1 1 ;
          4 1 3  3   1 1 ;
          4 2 1  4   1 1 ;
          4 2 2  3   1 1 ;
          4 2 3  2   1 1 ;
          4 3 1  3   1 1 ;
          4 3 2  3   1 1 ;
          4 3 3  2   1 1 ;
          
          5 1 1  5   1 1 ;
          5 1 2  4   1 1 ;
          5 1 3  3   1 1 ;
          5 2 1  4   1 1 ;
          5 2 2  3   1 1 ;
          5 2 3  3   1 1 ;
          5 3 1  3   1 1 ;
          5 3 2  2   1 1 ;
          5 3 3  3   1 1 ;];

ChSelection=addrule(ChSelection,RuleList);



figure
plotmf(ChSelection,'input',1)
figure
plotmf(ChSelection,'input',2)


figure
plotmf(ChSelection,'output',1)

figure 
plotfis(ChSelection)

writefis(ChSelection,'ChSelection.fis')