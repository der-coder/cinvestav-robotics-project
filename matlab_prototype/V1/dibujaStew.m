function [] = dibujaStew(R1,R2,b,B,P,p,R)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
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
%______________________________________________dibujar marcos de referencia
l=R1/1.618;
quiver3(0,0,0,l,0,0,'r');
quiver3(0,0,0,0,l,0,'g');
quiver3(0,0,0,0,0,l,'b');
l=R2/1.618;
i=[l 0 0 ]';
j=[0 l 0 ]';
k=[0 0 l ]';
ni=R*i;
nj=R*j;
nk=R*k;
quiver3(P(1),P(2),P(3),ni(1),ni(2),ni(3),'r');
quiver3(P(1),P(2),P(3),nj(1),nj(2),nj(3),'g');
quiver3(P(1),P(2),P(3),nk(1),nk(2),nk(3),'b')
end
