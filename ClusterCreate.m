function [ NewCH  NewGH] = ClusterCreate( S,CH,Nodes )

 sCH=readfis('ChSelection.fis');
 sGW=readfis('ClusterComm.fis');

 SMat=[];
 ClusterHeadCount=length(CH);
 Dist_CH_N=ones(1,3); 
 for ii=1:Nodes
      X1=S.X(ii);
      Y1=S.Y(ii);
      loc=1;
      for jj=1:ClusterHeadCount
        X2=S.X(CH(jj));
        Y2=S.Y(CH(jj)); 
         if  ii~=CH(jj)
           Dist_CH_N(loc,1:2)=[sqrt(((X2-X1)^2)+((Y2-Y1)^2)) CH(jj)]; 
           loc=loc+1;
         end
    end
     [Val Loct]=min(Dist_CH_N(:,1));
     SMat=[SMat; ii Dist_CH_N(Loct,2) Val];
   end
    
  %  Remove CHs if CHs in other Cluster   
  for ff=1:ClusterHeadCount
           zz=find(CH(ff)==SMat(:,1));
          if ~isempty(SMat) 
              SMat(zz,:)=[];
        end  
  end
  
  for ii=1:ClusterHeadCount
    Loc=find(CH(ii)==SMat(:,2));
    NewCluster{ii}=[SMat(Loc,1)' CH(ii)];    
    CM_Dist=[] ;
    CM_Eo=S.Eo(NewCluster{ii});
    P=[];
    ghP=[];
    for ij=1:length(NewCluster{ii})
        X1=S.X(NewCluster{ii}(ij));
        Y1=S.Y(NewCluster{ii}(ij));
        for kl=1:length(NewCluster{ii})
            X2=S.X(NewCluster{ii}(kl));
            Y2=S.Y(NewCluster{ii}(kl));
            CM_Dist(kl)=sqrt(((X2-X1)^2)+((Y1-Y1)^2));
        end
        CM_Dist(CM_Dist==0)=[];
        aCost=mean(CM_Dist);
        Cost=(aCost-min(CM_Dist))/(max(CM_Dist)-min(CM_Dist));
        NorE=(CM_Eo(ij)-min(CM_Eo(ij)))/(max(CM_Eo)-min(CM_Eo));
        if isnan(NorE)
           NorE=CM_Eo(ij);
        end
        D2BS=sqrt(((S.Sink(1)-X1)^2)+((S.Sink(2)-Y1)^2))/250;
        P(ij)=evalfis([ NorE Cost D2BS],sCH);
        D2BS=sqrt(((100-X1)^2)+((100-Y1)^2))/250;
        ghP(ij)=evalfis([NorE D2BS],sGW); 
    end
    
     [Val Loc]=max(P);
    NewCH(ii)=NewCluster{ii}(Loc);    
    [Val Loc]=sort(ghP,'descend');  
    if length(Loc)>1
     NewGH(ii)=NewCluster{ii}(Loc(2));
    else
      NewGH(ii)=NewCluster{ii}(Loc(1));
    end
  end  
  

end

