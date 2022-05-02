function [k] = G_J(A,B)
Ag = [A B];
for i=1:size(Ag,1)
    Ag(i,:) = Ag(i,:)./Ag(i,i);
    for j=1:size(Ag,1)
        if j~=i
            key1 = Ag(j,i)./Ag(i,i);
            Ag(j,:) = Ag(j,:)-key1.*Ag(i,:);
        end
    end
    k=Ag(:,end);
end
end