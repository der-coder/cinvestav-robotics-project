function [alerta] = STWRT_snapshot1(R1,R2,Lmin,B,rho,P,or)
%[alerta] = STWRT_snapshot1(R1,R2,Lmin,B,rho,P,or)
%dibuja en un figure activo la plataforma Gough-Stewart con los parámetros,
%orientación y posición especificados y obtiene un indicador acerca de la
%factibilidad de dicha posición
%   R1 es el radio de la base 
%   R2 es el radio de la plataforma
%   Lmin es la longitud mínima de los cilindros
%   B es el vector de posición del centro de la base [metros]
%   rho es la proporción entre los ángulos donde se colocan las juntas
%   P es el vector de posición del centro de la plataforma [metros]
%   or es el vector de orientación de la base [grados]
ang1=120/rho;%se obtiene el valor del ángulo menor
ang2=120-ang1;%se obtiene el valor del ángulo mayor, ambos deben sumar 120 grados
%------------------------------------------------------cálculo de componentes  
b=Vectores_b(ang1,ang2,R1);%obtiene las posiciones de las juntas en la base 
p=Vectores_p(ang1,ang2,R2);%obtiene las posiciones de las juntas en la plataforma
ax = or(1);
ay = or(2);;% descompone el vector de orientación en componentes
az = or(3);
R=rXYZ_Matrix(ax,ay,az);%obtener matriz de rotación - RxRyRz
pfinal=p_final(R,p,P);%calcula las posiciones de las juntas de la plataforma con respecto al marco base
dibujaStew(R1,R2,b,B,P,pfinal,R);%dibuja modelo de alambre del robot
a=Vectores_a(R,p,b,P);%calcula los vectores que van de la junta base a la junta de la plataforma 
Vectores(b,a);% dibuja los vectores que van de la junta base a la junta de la plataforma 
[cmB , cmP , alerta] = C_masa1(Lmin,a,b);%calcular la posición de los centros de masa de cada camisa y cilindro del robot y los grafica
end