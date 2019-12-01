function th_i = p_IK(R,q,lambda,anga,angb)
%% Prealocación de variables
th_1 = zeros(1,6); th_2 = zeros(1,6);
th_3 = zeros(1,6); th_4 = zeros(1,6);
th_5 = zeros(1,6); th_6 = zeros(1,6);
R1_3 = zeros(3,3,6); Rz_b = zeros(3,3,6);
Rz_a = zeros(3,3,6); R4_6 = zeros(3,3,6);

%% Calculo pseudo-Cinemática Inversa
% Matriz de rotacion de la plataforma
Rot = ROT(R(3),'z','r')*ROT(R(2),'y','r')*ROT(R(1),'x','r');

for i = 1:6
  % Asignacion de theta 3
  th_3(i) = q(i);
  % Obtencion de theta 1 y theta 2
  al = (cos(angb(i) + (pi/2))*(lambda(1,i))) + (sin(angb(i) + (pi/2))*lambda(2,i));
  bl = lambda(3,i);
  th_1(i) = atan(al/bl);
  cl = (sin(angb(i) + (pi/2))*lambda(1,i)) - (cos(angb(i) + (pi/2))*lambda(2,i));
  th_2(i) = asin(cl);
    
  R1_3(:,:,i) = ROT(th_1(i),'y','r')*ROT(th_2(i),'x','r');
  Rz_b(:,:,i) = ROT(angb(i) + (pi/2),'z','r');
  Rz_a(:,:,i) = ROT(anga(i) + (pi/2),'z','r');
  R4_6(:,:,i) = R1_3(:,:,i)'*Rz_b(:,:,i)'*Rot*Rz_a(:,:,i);
  % Obtencion de theta 4, theta 5 y theta 6
  th_4(i) = atan2(-(R4_6(1,2,i)),R4_6(2,2,i));
  th_5(i) = asin(R4_6(3,2,i));
  th_6(i) = atan2(-(R4_6(3,1,i)),(R4_6(3,3,i)));
end

th_i = [th_1;th_2;th_3;th_4;th_5;th_6];

end