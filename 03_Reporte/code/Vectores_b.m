function [b] = Vectores_b(ang1,ang2,R1)
%[b] = Vectores_b(ang1,ang2,R1)
%   entrega una matriz de 3x6 que contiene los vectores que indican la posici�n de las juntas de la base
%   con respecto al centro de la base.
b=zeros(3,6);%prealocando matriz
g=-ang2/2;%obtien el valor del �ngulo para el primer vector
for n=1:6%ciclo for para calcular los 6 vectores
   if mod(n,2) == 0 %si es una junta par
        g=g+ang1;%se le suma el �ngulo mayor
   else%si es una junta impar
       g=g+ang2;%se le suma el �ngulo menor
   end
   b(:,n)=[R1*cosd(g),R1*sind(g),0]';%construcci�n del vector a partir del �ngulo
end

end

