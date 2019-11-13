function [anga,angb,a,b,lmin] = plat_prop()
rb = .5;                        % Radio de la junta en la base
ra = .3;                        % Radio de la junta en la plataforma
lmin = 2;                       % Extensión minima del piston/actuador
hb = .1;                        % Separación lineal entre juntas en la base
ha = .1;                        % Separacion lineal entre juntas en la plataforma
% Iniciar los valores de la plataforma

th_b = asin(hb/(2*rb));
th_a = asin(ha/(2*ra));

angb = zeros(6,1);
anga = zeros(6,1);
for i = 1:6
  anga(i,1) = ((2*pi)/3)*floor((i+1)/2) - (pi/3) + (-1)^i*th_a;
  angb(i,1) = ((2*pi)/3)*floor(i/2) - (-1)^i*th_b;
end

a = zeros(3,6);
b = zeros(3,6);
for i = 1:6
  a(1,i) = ra*cos(anga(i));
  a(2,i) = ra*sin(anga(i));
  a(3,i) = 0;
  b(1,i) = rb*cos(angb(i));
  b(2,i) = rb*sin(angb(i));
  b(3,i) = 0;
end
end