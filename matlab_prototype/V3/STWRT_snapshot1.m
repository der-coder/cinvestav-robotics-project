function [alerta] = STWRT_snapshot1(R1,R2,Lmin,B,rho,P,or)
%[alerta] = STWRT_snapshot1(R1,R2,Lmin,B,rho,P,or)
%dibuja en un figure activo la plataforma Gough-Stewart con los par�metros,
%orientaci�n y posici�n especificados y obtiene un indicador acerca de la
%factibilidad de dicha posici�n
%   R1 es el radio de la base 
%   R2 es el radio de la plataforma
%   Lmin es la longitud m�nima de los cilindros
%   B es el vector de posici�n del centro de la base [metros]
%   rho es la proporci�n entre los �ngulos donde se colocan las juntas
%   P es el vector de posici�n del centro de la plataforma [metros]
%   or es el vector de orientaci�n de la base [grados]
ang1=120/rho;%se obtiene el valor del �ngulo menor
ang2=120-ang1;%se obtiene el valor del �ngulo mayor, ambos deben sumar 120 grados
%------------------------------------------------------c�lculo de componentes  
b=Vectores_b(ang1,ang2,R1);%obtiene las posiciones de las juntas en la base 
p=Vectores_p(ang1,ang2,R2);%obtiene las posiciones de las juntas en la plataforma
ax = or(1);
ay = or(2);;% descompone el vector de orientaci�n en componentes
az = or(3);
R=rXYZ_Matrix(ax,ay,az);%obtener matriz de rotaci�n - RxRyRz
pfinal=p_final(R,p,P);%calcula las posiciones de las juntas de la plataforma con respecto al marco base
dibujaStew(R1,R2,b,B,P,pfinal,R);%dibuja modelo de alambre del robot
a=Vectores_a(R,p,b,P);%calcula los vectores que van de la junta base a la junta de la plataforma 
Vectores(b,a);% dibuja los vectores que van de la junta base a la junta de la plataforma 
[cmB , cmP , alerta] = C_masa1(Lmin,a,b);%calcular la posici�n de los centros de masa de cada camisa y cilindro del robot y los grafica
end