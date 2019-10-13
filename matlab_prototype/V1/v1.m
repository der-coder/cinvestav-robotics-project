%-----------------------------------------------------parámetros de entrada
R1=1;
R2=R1/1.618;
B=[0 0 0]';
P=[0 0 1]';
rho=1.618*3;
ang1=120/rho;
ang2=120-ang1;

b=Vectores_b(ang1,ang2,R1);%b - posiciones de las juntas en la base
%-----------------------------p - posiciones de las juntas en la plataforma 
p=zeros(3,6);
ere=zeros(3,6);
g=-(ang2/2)+60;
for n=1:6
   if mod(n,2) == 0
        g=g+ang1;
   else
       g=g+ang2;
   end
   ere(:,n)=[R2*cosd(g),R2*sind(g),0]';
end
p(:,1)=ere(:,6);
for n=1:5
p(:,n+1)=ere(:,n);
end
%------------------------------------------------------ingreso orientación  
ax = input('thetha = ');
ax=ax*(2*pi/360);
ay = input('phi = ');
ay=ay*(2*pi/360);
az = input('psi = ');
az=az*(2*pi/360);
aa=ax;
ab=ay;
ac=az;
%-------------------------------planteamiento de la matriz de rotación - RxRyRz
R=[                cos(ab)*cos(ac)               -cos(ab)*sin(ac)                                   sin(ab);
    (sin(aa)*sin(ab)*cos(ab))+(cos(aa)*sin(ac)) -(sin(aa)*sin(ab)*sin(ac))+(cos(aa)*cos(ac)) -(sin(aa)*cos(ab));
    -(cos(aa)*sin(ab)*cos(ac))                     (cos(aa)*sin(ab)*sin(ac))+(sin(aa)*cos(ac)) cos(aa)*cos(ab)];
%calcula las posiciones de las juntas de la plataborma con respecto al marco base
pfinal=zeros(3,6);
for n=1:6
    pfinal(:,n)=(R*p(:,n))+P;
end
dibujaStew(R1,R2,b,B,P,pfinal,R);%dibuja modelo de alambre del robot
%-calcula los vectores que ban de la junta base a la junta de la plataforma 
a=zeros(3,6);
for i=1:6
   a(:,i)=(R*p(:,i))+P-b(:,i);   
end
Vectores(b,a);% dibuja los vectores "a"
%-------------------------------calcular la posición de los centros de masa