function fit = fitness(CHs,S)
  
   InfoNode=[];
   for i=1:100
        X1=S.X(i);
        Y1=S.Y(i);
       for j=1:length(CHs)
            X2=S.X(CHs(j));
            Y2=S.Y(CHs(j));
            Dis_to_CHs(j)=sqrt(((X2-X1)^2)+((Y2-Y1)^2));
       end   
       [Val Loc]=sort(Dis_to_CHs);
       if Val(1)==0
          InfoNode=[InfoNode;i CHs(Loc(2)) Val(2)];
       else
           InfoNode=[InfoNode;i CHs(Loc(1)) Val(1)];
       end
   end  
   
   for j=1:length(CHs)
       AvgDis(j)=mean(InfoNode(find(InfoNode(:,2)==CHs(j)),3));
   end
   
   fit=1/sum(AvgDis);
   


end

