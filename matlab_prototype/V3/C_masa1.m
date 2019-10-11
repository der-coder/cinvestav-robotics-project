function [cmB,cmP,alerta] = C_masa1(Lmin,a,b)
%[cmB,cmP,alerta] = C_masa1(Lmin,a,b) obtiene las ubicaciones de los
%centros de masa de todas las camisas y todos los émbolos de los cilindros
%de la plataforma Gough-Stewart.
%   Lmin es la longitud mínima de un cilindro
%   a es una matriz de 3x6 con los vectores de cada pistón.
%   b es una matriz de 3x6 con las ubicaciones de las juntas en la base
%   cmB es una matriz de 3x6 con los vectores de los centros de masa de cada camisa.
%   cmP es una matriz de 3x6 con los vectores de los centros de masa de cada émbolo.
%   alerta es un valor que indica la viablidad de la posición deseada.
alerta=0;%inicializando la variable
a_u=zeros(3,6);%prealocando en memoria
a_n=zeros(1,6);%prealocando en memoria
Lcmb=zeros(1,6);%prealocando en memoria
cmB=zeros(3,6);%prealocando en memoria
cmP=zeros(3,6);%prealocando en memoria
for n=1:6%ciclo for para obtener los centros de masa 
    a_n(n)=norm(a(:,n));%se obtiene la norma del vector de cada piston
    if (a_n(n) < Lmin)%si la longitud del vector es menor a la longitud mínima del cilindro
        alerta = -1;%se notifica que es inviable porque requiere una hiper-compresión      
    elseif (a_n(n) > 2*Lmin)%si la longitud del vector es mayor a la longitud máxima del cilindro
        alerta = 1;%se notifica que es inviable porque requiere una hiper-extensión
    end
    a_u(:,n)=a(:,n)/a_n(n);%se obtiene el vector unitario de cada piston
    Lcma=Lmin/2;%el centro de masa de la camisa debe encontrarse a la mitad de la camisa
    Lcmb(n)=a_n(n)-Lcma;%el centro de masa del émbolo debe encontrarse a Lmin/2 de la longitud total del vector del cilindro
    cmB(:,n)=(a_u(:,n)*Lcma)+b(:,n);%obtención del centro de masa de la camisa con respecto al centro de la base
    cmP(:,n)=a_u(:,n)*Lcmb(n)+b(:,n);%obtención del centro de masa del émbolo con respecto al centro de la base
    scatter3(cmB(1,n),cmB(2,n),cmB(3,n),'k');% graficación del centro de masa de la camisa
    scatter3(cmP(1,n),cmP(2,n),cmP(3,n),'m');% graficación del centro de masa del émbolo
end   
end