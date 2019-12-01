clear
clc
% Prealicacion de variables
twist_p = zeros(6,1); tau = zeros(6,1);
Go = diag([0;0;9.81;0;0;0]);
A = zeros(6,6);

% Posicion a linealizar
d = [0;0;1.5];
R = [0,0,0]';


Rot = ROT(R(3),'z','r')*ROT(R(2),'y','r')*ROT(R(1),'x','r');

% Constantes plataforma
[~,~,a,b,~,I] = PGS_data();

% Cinemática
[q,lambda] = IK(d,R,a,b);

for i = 1:6
    A(i,1:3) = lambda(:,i)';
    d = Rot*a(:,i);
    A(i,4:6) = cross(d,lambda(:,i))';
end

J = inv(A);
Je = diag(ones(6,1)*(.0032)*(250*pi)^2);

% Tensor masas sin motores
Hqsm = J'*(I(:,:,7)+I(:,:,2)*6+I(:,:,4)*6)*J;
% Tensor masa con motores
Mp = (I(:,:,7)+I(:,:,2)*6+I(:,:,4)*6) + A'*Je*A;
Hq = J'*Mp*J;

% Matriz gravedad
Gq = J'*Mp*Go*J;


