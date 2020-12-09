clc
close all
clear all

load Best100

figure
plot(Performance.Dead,'--b','linewidth',2)
xlabel('Rounds')
ylabel('Number of Dead Nodes')
title('Percentage of dead nodes versus rounds for WSN with N =100 (Proposed)')


figure
plot(Performance.Alive,'--b','linewidth',2)
xlabel('Rounds')
ylabel('Number of Alive Nodes')
title('Percentage of alive nodes versus rounds for WSN with N =100 (Proposed)')



figure
plot(Performance.Energy./100,'--b','linewidth',2)
xlabel('Rounds')
ylabel('Energy Cosumpation')
title('Average energy consumption per SN for WSN with N =100  (Proposed)')



rEng=[0.5 0.46 0.42 0.36 0.33  0.28 0.25 0.23 0.18 0.13 0.11 0.08 0.055 0 0;
      0.5 0.45 0.39 0.34 0.28  0.24 0.18 0.14 0.09 0.03 0    0    0     0 0;
      0.5 0.39 0.28 0    0     0    0    0    0    0    0    0    0     0 0];
EEFRP=[920 1;1080 12;1100 20;1150 30;1180 42;1200 52;1250 60;1280 70;1300 80;1310 90;1400 100];
MH_EEBCDA=[620 1;800 10;820 20;840 30;850 40;900 52;930 60;980 70;990 80;1000 90;1050 100];
FD_LEACH=[500 1;505 10;510 22;515 30;516 40;517 50;518 60;520 70;522 80;523 90;528 100];
FND=find(Performance.Dead==1);
HND=find(Performance.Dead==50);
LND=find(Performance.Dead==100);
FHL=[500 518 528;620 930 1050;920 1250 1400;FND(1) HND(1) LND(1)  ];


figure
plot(FD_LEACH(:,1),FD_LEACH(:,2),'-gd','linewidth',2)
hold on
plot(MH_EEBCDA(:,1),MH_EEBCDA(:,2),'-ro','linewidth',2)
hold on
plot(EEFRP(:,1),EEFRP(:,2),'-^b','linewidth',2)
hold on
plot(Performance.Dead,'--m','linewidth',2)
xlabel('Rounds')
ylabel('Number of Dead Nodes')
legend('FD-LEACH','MH-EEBCDA','EEFRP','Proposed')
axis([0 2500 0 100])
title('Percentage of dead nodes versus rounds for WSN with N =100')

figure
plot(FD_LEACH(:,1),100-FD_LEACH(:,2),'-gd','linewidth',2)
hold on
plot(MH_EEBCDA(:,1),100-MH_EEBCDA(:,2),'-ro','linewidth',2)
hold on
plot(EEFRP(:,1),100-EEFRP(:,2),'-^b','linewidth',2)
hold on
plot(Performance.Alive,'--m','linewidth',2)
xlabel('Rounds')
ylabel('Number of Alive Nodes')
legend('FD-LEACH','MH-EEBCDA','EEFRP','Proposed')
axis([0 2500 0 100])
title('Percentage of alive nodes versus rounds for WSN with N =100')


figure
plot(linspace(0,1000,15),rEng(3,:),'-gd','linewidth',2)
hold on
plot(linspace(0,1200,15),rEng(2,:),'-ro','linewidth',2)
hold on
plot(linspace(0,1400,15),rEng(1,:),'-^b','linewidth',2)
hold on
plot(Performance.Energy./100,'--m','linewidth',2)
xlabel('Rounds')
ylabel('Remaining Energy In Joules')
axis([0 2500 0 0.5])
legend('FD-LEACH','MH-EEBCDA','EEFRP','Proposed')
title('Average energy consumption per SN for WSN with N =100')

figure
bar(FHL)
ylabel('Rounds')
set(gca,'xTicklabel',{'FD-LEACH','MH-EEBCDA','EEFRP','Proposed'})
legend('FND','HND','LND')
title('FND, HND and LND plots for WSN N =100')

%% Node 400
load Best400
FND=find(Performance.Dead==1);
HND=find(Performance.Dead==50);
LND=find(Performance.Dead==99);
FHL=[580 608 680;920 980 1100;1210 1650 2100;FND(end) HND(1) LND(1)  ];

ED_Leach4=[560 1;600 11;601 20;603 30;605 40;608 50;610 60;615 70;618 80;625 90;680 100 ];
MH_EEBCDA4=[920 1;932 10;944 20;966 30;972 40;980 50;1000 60;1043 70 ;1050 80;1080 90;1100 100];
EEFRP4=[1210 1;1410 10; 1500 20;1550 30 ;1600 40;1650 50;1700 60;1750 70;1800 80;1900 90;2100 100 ];

figure
plot(Performance.Dead,'--b','linewidth',2)
xlabel('Rounds')
ylabel('Number of Dead Nodes')
title('Percentage of dead nodes versus rounds for WSN with N =400 (Proposed)')


figure
plot(Performance.Alive,'--b','linewidth',2)
xlabel('Rounds')
ylabel('Number of Alive Nodes')
title('Percentage of alive nodes versus rounds for WSN with N =400 (Proposed)')



figure
plot(Performance.Energy/400,'--b','linewidth',2)
xlabel('Rounds')
ylabel('Energy Cosumpation')
title('Average energy consumption per SN for WSN with N =400  (Proposed)')



figure
bar(FHL)
ylabel('Rounds')
set(gca,'xTicklabel',{'FD-LEACH','MH-EEBCDA','EEFRP','Proposed'})
legend('FND','HND','LND')
title('FND, HND and LND plots for WSN N =400')

figure
plot(ED_Leach4(:,1),ED_Leach4(:,2),'-gd','linewidth',2)
hold on
plot(MH_EEBCDA4(:,1),MH_EEBCDA4(:,2),'-ro','linewidth',2)
hold on
plot(EEFRP4(:,1),EEFRP4(:,2),'-^b','linewidth',2)
hold on
plot((Performance.Dead/400)*100,'--m','linewidth',2)
xlabel('Rounds')
ylabel('Number of Dead Nodes')
legend('FD-LEACH','MH-EEBCDA','EEFRP','Proposed')
axis([0 2500 0 100])
title('Percentage of dead nodes versus rounds for WSN with N =400')

figure
plot(ED_Leach4(:,1),100-ED_Leach4(:,2),'-gd','linewidth',2)
hold on
plot(MH_EEBCDA4(:,1),100-MH_EEBCDA4(:,2),'-ro','linewidth',2)
hold on
plot(EEFRP4(:,1),100-EEFRP4(:,2),'-^b','linewidth',2)
hold on
plot((Performance.Alive/400)*100,'--m','linewidth',2)
xlabel('Rounds')
ylabel('Number of Alive Nodes')
legend('FD-LEACH','MH-EEBCDA','EEFRP','Proposed')
axis([0 2500 0 100])
title('Percentage of alive nodes versus rounds for WSN with N =400')
