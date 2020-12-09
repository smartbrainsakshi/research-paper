function [POP] = CheckLimits(POP,LB,UB,Node)

Len=length(POP);
POP=round(abs(POP));

Status=sum(POP<LB | POP>UB);
if Status>0
    POP=randi(Node,1,Len); 
end

if sum(isnan(POP))>0
    POP=randi(Node,1,Len); 
end

while length(unique(POP))~=Len    
   POP=randi(Node,1,Len); 
end

end

