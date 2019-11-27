% Algoritmo1
clear
clc

rb = .5;
ra = .3;

anga = [60,60,180,180,300,300];
angb = [0,120,120,240,240,360];


a = zeros(3,6);
b = zeros(3,6);
for i = 1:6
    anga(i) = deg2rad(anga(i));
    angb(i) = deg2rad(angb(i));
    a(:,i) = [ra*cos(anga(i)); ra*sin(anga(i)); 0];
    b(:,i) = [rb*cos(angb(i)); rb*sin(angb(i)); 0];
end

d = [0;0;2];
R_ang = [0,0,0];

R = Rotz(R_ang(3))*Roty(R_ang(3))*Rotx(R_ang(1));
th_1 = zeros(1,6);
th_2 = zeros(1,6);
th_3 = zeros(1,6);


for i = 1:6
    l(:,i) = d + R*a(:,i) - b(:,i);
    q(i)=norm(l(:,i));
    th_3(i) = q(i);
    lam(:,i)=(l(:,i))/(q(i));
    th_1(i) = atan((((cos(angb(i)))*lam(1,i))+((sin(angb(i)))*lam(2,i)))/(lam(3,i))); %theta1
    th_2(i) = asin(((sin(angb(i)))*(lam(1,i)))-((cos(angb(i)))*(lam(2,i)))); %theta 2
    
end

for i = 1:6
    RRR = Roty(th_1(i))*Rotx(th_2(i))
    RRRR = Rotz(angb(i))'*lam(:,i)
end
