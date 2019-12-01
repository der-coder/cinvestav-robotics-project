function [anga,angb,a,b,lmin,I] = PGS_data()
%% Prealocacion de variables
angb = zeros(6,1); anga = zeros(6,1);
a = zeros(3,6); b = zeros(3,6);

%% Constantes de la plataforma
rb = .44205;                        % Radio de la junta en la base
ra = .36248;                        % Radio de la junta en la plataforma
lmin = 1.28929;                 % Extensión minima del piston/actuador
hb = .7;                        % Separación lineal entre juntas en la base
ha = .2986;                        % Separacion lineal entre juntas en la plataforma
I = zeros(6,6,7);               % Tensores de inercia de los elementos

% Separacion angular juntas
th_b = asin(hb/(2*rb));
th_a = asin(ha/(2*ra));

% Angulo union de junta en plataforma
for i = 1:6
  anga(i,1) = ((2*pi)/3)*floor((i+1)/2) - (pi/3) + (-1)^i*th_a;
  angb(i,1) = ((2*pi)/3)*floor(i/2) - (-1)^i*th_b;
end

% Punto de union de junta
for i = 1:6
  a(1,i) = ra*cos(anga(i));
  a(2,i) = ra*sin(anga(i));
  a(3,i) = 0;
  b(1,i) = rb*cos(angb(i));
  b(2,i) = rb*sin(angb(i));
  b(3,i) = 0;
end

% Matrices de inercia
I(:,:,7) = createPlatform();
I(:,:,2) = createPiston();
I(:,:,4) = createMovingPiston();
end