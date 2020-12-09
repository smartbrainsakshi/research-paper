clc
close all
clear 

ClusterComm=newfis('ClusterComm');

ClusterComm = addvar(ClusterComm,'input','Residual Energy',[0 1]);
ClusterComm=  addmf(ClusterComm,'input',1,'L','trimf',[-0.4 0 0.4]);
ClusterComm = addmf(ClusterComm,'input',1,'M','trimf', [0.1 0.5 0.9]);
ClusterComm = addmf(ClusterComm,'input',1,'H','trimf',[0.6 1 1.4]);


ClusterComm = addvar(ClusterComm,'input','Distance to BS',[0 1]);
ClusterComm=  addmf(ClusterComm,'input',2,'L','trimf',[-0.4 0 0.4]);
ClusterComm = addmf(ClusterComm,'input',2,'M','trimf', [0.1 0.5 0.9]);
ClusterComm = addmf(ClusterComm,'input',2,'H','trimf',[0.6 1 1.4]);


ClusterComm = addvar(ClusterComm,'output','Possibility',[0 1]);
ClusterComm=  addmf(ClusterComm,'output',1,'VL','trimf',[-0.4 0 0.1019]);
ClusterComm = addmf(ClusterComm,'output',1,'L','trimf', [0.0648 0.2262 0.401]);
ClusterComm = addmf(ClusterComm,'output',1,'M','trimf',[0.3003 0.5 0.639]);
ClusterComm = addmf(ClusterComm,'output',1,'H','trimf', [0.554 0.7235 0.901]);
ClusterComm = addmf(ClusterComm,'output',1,'VH','trapmf',[0.792 0.9193 1.02 1.23]);


showfis(ClusterComm)




RuleList=[1 1  3 1 1;
          2 1  4 1 1;
          3 1  5 1 1 ;
          1 2  2 1 1 ;
          2 2  3 1 1 ;
          3 2  4 1 1 ;
          1 3  1 1 1 ;
          2 3  2 1 1 ;
          3 3  3 1 1 ;];

ClusterComm=addrule(ClusterComm,RuleList);



figure
plotmf(ClusterComm,'input',1)
figure
plotmf(ClusterComm,'input',2)


figure
plotmf(ClusterComm,'output',1)

figure 
plotfis(ClusterComm)

writefis(ClusterComm,'ClusterComm.fis')