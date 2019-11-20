function twist_dot = Q_LIK(Jac,t_dot,X_p,twist_p,lam,tau,b_f,R_rpy,a)

G0 = [0;0;-9.81;0;0;0];
twist_l = zeros(6,6,6);
ac = zeros(6,7,6);
sj = zeros(6,6);
sj(5,1) = 1;
sj(4,2) = 1;
sj(3,3) = 1;
sj(6,4) = 1;
sj(4,5) = 1;
sj(5,6) = 1;

for i = 1:6
  ac(:,1,i) = G0;
end
M_j = zeros(6,6,6,6);
d_cm = zeros(3,6);          % aqui va r_c
H_j = zeros(6,6,6,6);
H_i = zeros(6,6,6);
% Fuerzas
wrench = zeros(6,6,6);
b_R = zeros(6,6,6);
% Fricciones viscosas
b_R(5,1,1) = b_f(1);
b_R(4,2,2) = b_f(2);
b_R(3,3,3) = b_f(3);
b_R(6,4,4) = b_f(4);
b_R(4,5,5) = b_f(5);
b_R(5,6,6) = b_f(6);
dis_f = zeros(6,6,6);
F = zeros(6,6,6);

% Coriolis
hj = zeros(6,6,6);
hi = zeros(6,6,6);
H_vi = zeros(6,6,6);
Mp = massTensor(1,eye(3),[0;0;0]);            % tensor de inercia de la plataforma
Hv = Mp;
hv = zeros(6,1);
for j = 1:6
  
  for i = 1:6
    % Obtener twist de las juntas
    twist_l(:,j,i) = Jac(:,:,j,i)*t_dot(:,i);
    % Obtener aceleracion de las juntas
    ac(:,j,i) = X_p(:,:,2,i)*ac(:,1,i) - t_dot(2,i)*op_omg(sj(:,2))*twist_l(:,2,i);
    if j ~= 6
      % Obtener el tensor de inercia respecto a las juntas locales
      M_j(:,:,j,i) = massTensor(1,eye(3),d_cm(:,i));
      % Obtener la matriz de inercia de la junta
      H_j(:,:,j,i) = Jac(:,:,j,i)'*M_j(:,:,j,i)*Jac(:,:,j,i);
      H_i(:,:,i) = H_i(:,:,i) + H_j(:,:,j,i);
      % Obtener Fuerzas externas y fricciones
      % Calcular fricciones con elemento padre
      dis_f(:,j,i) = b_R(:,:,i)*t_dot(:,i);
      % Fuerzas externas totales
      F(:,j,i) = wrench(:,j,i) + dis_f(:,1,i);
      % Obtener coriolis
      hj(:,j,i) = Jac(:,:,j,i)'*(M_j(:,:,j,i)*ac(:,j,i) - F(:,j,i) - op_omg(twist_l(:,j,i))'*M_j(:,:,j,i)*twist_l(:,j,i));
      hi(:,i) = hi(:,i) + hj(:,j,i);
    end
  end %% end for j
  
  H_vi(:,:,i) = inv(Jac(:,:,6,i))'*H_i(:,:,i)*inv(Jac(:,:,6,i));
  Hv(:,:) = Hv(:,:) + H_vi(:,:,i);
  hv(:,1) = hv + inv(Jac(:,:,6,i))'*hi(:,i) - H_vi(:,:,i)*ac(:,6,i);
  
end %% end for i

% Obtener Fuerzas en la plataforma
Fep = [0;0;0;0;0;0];
% Obtener coriolis
h_p = -op_omg(twist_p)*Mp*twist_p - Fep;

hv = hv + h_p;
Hv_inv = inv(Hv);
A = zeros(6,6);
for i = 1:6
    A(i,1:3) = lam(:,i)';
    d = R_rpy*a(:,i);
    cc = cross(d,lam(:,i));
    A(i,4:6) = cc';
end
Gp = zeros(6,1);
Gp(1:3,1) = (R_rpy'*[0;0;9.81]);
R = [R_rpy,zeros(3,3);zeros(3,3),R_rpy];

twist_dot = Hv_inv*(R'*A'*tau - hv) - Gp;
end