function [] = Vectores(b,a)
%[] = Vectores(b,a)grafica 
% vectores que van 
% desde las ubicaciones
% especificadas en "b" 
% hacia las 
% ubicaciones especificadas en "a"
% b es una matriz de 3x6 con 
% las ubicaciones de 
% las juntas en la base
% a es una matriz de 3x6 con los 
% vectores de cada piston.
for i=1:6
% ciclo for para graficar los 6 vectores
    quiver3(b(1,i),b(2,i),b(3,i),a(1,i),a(2,i),a(3,i),0);%graficar un vector
    hold on;
end
end

