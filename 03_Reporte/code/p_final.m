function [Pfinal] = p_final(R,p,P)
%[Pfinal] = p_final(R,p,P) en una matriz de 3x6 entrega la posiciones de las rotulas de la
%plataforma con respecto al centro de la base
%   R es la matriz de rotación
%   p es la matriz de 3x6 con los vectores de lar rotulas de la plataforma
%   P es el vector posición del centro de la plataforma
Pfinal=zeros(3,6);%prealocando en memoria
for n=1:6%ciclo for para calcular los vectores
    Pfinal(:,n)=(R*p(:,n))+P;%formula para obtener un vector
end
end

