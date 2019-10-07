function [a] = Vectores_a(R,p,b,P)
%[a] = Vectores_a(R,p,b,P)
%   entrega una matriz de 3x6 que contiene los vectores que indican la
%   posición de las juntas de la plataforma
%   con respecto a su respectiva junta en la base.
a=zeros(3,6);%prealocando matriz
for i=1:6%ciclo for para calcular los 6 vectores
   a(:,i)=(R*p(:,i))+P-b(:,i);%operación para obtener los vectores que indican la posición de las juntas de la plataforma con respecto a su respectiva junta en la base.    
end

end

