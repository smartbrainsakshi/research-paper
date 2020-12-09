clc
close all
clear all
warning off

% Transmit Energy
Eele=50*0.000000001;
%Transmit Amplifier types
Efs=10*0.000000000001;
Emp=0.0013*0.000000000001;
EDA=5*0.000000001;

Eo=0.5;
Area=200;

do=sqrt(Efs/Emp);
Node=400;

Packet=4000;
Sink=[100 250];

figure
for i=1:Node
    S.X(i)=rand*Area;
    S.Y(i)=rand*Area;
    S.Eo(i)=Eo;
    plot(S.X(i),S.Y(i),'ok')
    hold on
end
xlabel('X-Axis')
ylabel('Y-Axis')
title('Network Setup')
hold on
plot(Sink(1),Sink(2),'pr','linewidth',3,'markersize',10)
S.Sink=Sink;


Rmax=4000;
flag=1;

for r=1:Rmax
    networkEng=0;
    dead=0;
    
     for i=1:Node       
       if (S.Eo(i)<=0)
         dead=dead+1;
       end         
       if (S.Eo(i)>0)
        networkEng=networkEng+S.Eo(i); 
       end
     end

     if (dead==1)
       if(flag==1)
          FirstDead=r;          
          flag=0;
       end 
     end    
     
     
     nCHs=5;
     LB=1;
     UB=Node;     
     nPOP=5;
     IntPop=randi(Node,nPOP,nCHs);
     It=5;     
     [OptCH bestFit Conver] = PSO(IntPop,It,LB,UB,S,Node);
     [BestCH NewGH]= ClusterCreate( S,OptCH,Node );          
     
      for i=1:nCHs
          X1=S.X(BestCH(i));
          Y1=S.Y(BestCH(i));
          X2=S.X(NewGH(i));
          Y2=S.Y(NewGH(i));  
          distance=sqrt(((X2-X1)^2)+((Y2-Y1)^2)); 
        if S.Eo(BestCH(i))>0   
         if (distance<=do)
           S.Eo(BestCH(i))=S.Eo(BestCH(i))-(((Eele)*Packet)+(Efs*Packet*distance*distance));
          else
           S.Eo(BestCH(i))=S.Eo(BestCH(i))-(((Eele)*Packet)+(Emp*Packet*distance*distance*distance*distance));
         end 
        end
      end
      
       for i=1:Node
            X1=S.X(i);
            Y1=S.Y(i);          
           if (S.Eo(i)>0 )
                distN2CH=[];
               for j=1:nCHs                      
                 X2=S.X(BestCH(j));
                 Y2=S.Y(BestCH(j));                      
                 distN2CH(j)=sqrt(((X2-X1)^2)+((Y1-Y1)^2));
               end
                [distVal CH_Loc]=min(distN2CH);
               if (distVal<=do)
                 S.Eo(i)=S.Eo(i)-((Eele*Packet)+(Efs*Packet*(distVal*distVal)));
                else
                 S.Eo(i)=S.Eo(i)-((Eele*Packet)+(Emp*Packet*distVal*(distVal*distVal*distVal)));
               end
             end
       end
       
  Performance.Dead(r)=dead;
  Performance.Alive(r)=Node-dead;
  Performance.Energy(r)=networkEng; 
    r    
  
  if dead==Node
     break; 
  end
      
end

 
Performance.FirstDead=FirstDead;
Performance.LastDead=LastDead;
HalfDead=find(Performance.Dead>=Node/2 & Performance.Dead<=(Node/2)+2); 
Performance.HalfDead=HalfDead(1);

 

figure
plot(Performance.Dead,'--b','linewidth',2)
xlabel('Rounds')
ylabel('Number of Dead Nodes')


figure
plot(Performance.Alive,'--b','linewidth',2)
xlabel('Rounds')
ylabel('Number of Alive Nodes')


figure
plot(Performance.Energy,'--b','linewidth',2)
xlabel('Rounds')
ylabel('Energy Cosumpation')




             
             
             
             