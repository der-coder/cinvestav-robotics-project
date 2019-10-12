function [p] = Vectores_p(ang1,ang2,R2)
%[p] = Vectores_p(ang1,ang2,R1)
%   entrega una matriz de 3x6 que contiene los vectores que indican la
%   posici�n de las juntas de la plataforma
%   con respecto al centro de la plataforma.
p=zeros(3,6);%prealocando matriz
ere=zeros(3,6);%prealocando matriz auxiliar
g=-(ang2/2)+60;%obtien el valor del �ngulo para el primer vector, debe estar desfasado 60 grados para que quede a la mitad del vector de la base
for n=1:6%ciclo for para calcular los 6 vectores
   if mod(n,2) == 0%si es una junta par
        g=g+ang1;%se le suma el �ngulo mayor
   else%si es una junta impar
       g=g+ang2;%se le suma el �ngulo menor
   end
   ere(:,n)=[R2*cosd(g),R2*sind(g),0]';%construcci�n del vector a partir del �ngulo
end
p(:,1)=ere(:,6);%el primer vector debe ser el �ltimo calculado, para tener cilindros con orientaciones en "espejo"
for n=1:5%ciclo for para hacer el corrimiento de vectores
p(:,n+1)=ere(:,n);%se realiza el corrimiento de un vector
end
end

