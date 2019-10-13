function [] = STWRT_snapshot(R1,R2,Lmin,B,rho,P,or)
%STWRT_snapshot(R1,R2,Lmin,B,rho,P,or)
%dibuja en un figure activo la plataforma Gough-Stewart con los parámetros,
%orientación y posición especificados 
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
ay = or(2);% descompone el vector de orientación en componentes
az = or(3);
R=rXYZ_Matrix(ax,ay,az);%obtiene matriz de rotación - RxRyRz
pfinal=p_final(R,p,P);%calcula las posiciones de las juntas de la plataforma con respecto al marco base
dibujaStew(R1,R2,b,B,P,pfinal,R);%dibuja modelo de alambre del robot
a=Vectores_a(R,p,b,P);%calcula los vectores que van de la junta base a la junta de la plataforma 
Vectores(b,a);% dibuja los vectores que van de la junta base a la junta de la plataforma 
[cmB , cmP , alerta] = C_masa1(Lmin,a,b);%calcular la posición de los centros de masa de cada camisa y cilindro del robot y los grafica
    if alerta==1 %si el valor de la alerta es 1 significa que la posición deseada implica que algún cilindro rebase su longitud máxima
        uiwait(warndlg('la posición deseada no es factible (hiper-extensión)','Advertencia'));%muestra el cuadro de advertencia
    elseif alerta==-1 %si el valor de la alerta es -1 significa que la posición deseada implica que algún cilindro deba ser más corto que su longitud mínima
        uiwait(warndlg('la posición deseada no es factible (hiper-compresión)','Advertencia'));%muestra el cuadro de advertencia
    end
end

