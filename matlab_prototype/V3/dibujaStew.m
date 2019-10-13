function [] = dibujaStew(R1,R2,b,B,P,p,R)
%[] = dibujaStew(R1,R2,b,B,P,p,R) dibuja el esquema de la plataforma
%Gough-Stewart, con sus juntas, los centros de la base, la plataforma y
%los marcos de referencia inicial y final.
%   R1 es el radio de la base 
%   R2 es el radio de la plataforma
%   b es la matriz con las posiciones de las juntas de la base
%   B es el vector de posición del centro de la base [metros]
%   P es el vector de posición del centro de la plataforma [metros]
%   p es la matriz con las posiciones de las juntas de la plataforma
%   R es la matriz de rotacion Rx-Ry-Rz

%------------------------------------------------graficar juntas de la base
be=b';
scatter3(be(:,1),be(:,2),be(:,3));
axis equal;
hold on;
%------------------------------------------------graficar centro de la base
scatter3(B(1),B(2),B(3),'b');
%-----------------------------------------------------graficar circulo base
g=0:10:360;
c1x=R1*cosd(g);
c1y=R1*sind(g);
c1z=g-g;
plot3(c1x,c1y,c1z,'b');
%------------------------------------------graficar juntas de la plataforma
pe=p';
scatter3(pe(:,1),pe(:,2),pe(:,3),'r');
%------------------------------------------graficar centro de la plataforma
scatter3(P(1),P(2),P(3),'r');
%-----------------------------------------graficar circulo de la plataforma
[g1,g2] = size(g);
A=zeros(3,g2);
for n=1:g2
    A(:,n)=R*[R2*cosd(g(n)),R2*sind(g(n)),0]'+P;
end    
plot3(A(1,:),A(2,:),A(3,:),'r');
%______________________________________________dibujar marco de referencia de la base
l=R1/1.618;
quiver3(0,0,0,l,0,0,'r');
quiver3(0,0,0,0,l,0,'g');
quiver3(0,0,0,0,0,l,'b');
%______________________________________________dibujar marco de referencia de la plataforma
l=R2/1.618;
i=[l 0 0 ]';
j=[0 l 0 ]';
k=[0 0 l ]';
ni=R*i;
nj=R*j;
nk=R*k;
quiver3(P(1),P(2),P(3),ni(1),ni(2),ni(3),'r');
quiver3(P(1),P(2),P(3),nj(1),nj(2),nj(3),'g');
quiver3(P(1),P(2),P(3),nk(1),nk(2),nk(3),'b');
grid on;
view(45,45);%cambiar orientación de la perspectiva
axis equal;%mantener la misma escala en la gráfica
end
