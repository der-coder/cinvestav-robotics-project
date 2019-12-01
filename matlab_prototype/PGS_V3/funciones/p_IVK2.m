function [X_plu, J,t_dot] = p_IVK2(th_i,lambda,lmin,twist_p)
%% Prealocacion de variables
X_plu = zeros(6,6,6,6); cero = [0,0,0];
J0 = zeros(6,6); J = zeros(6,6,6,6);
Sj = zeros(6,6,6); t_dot = zeros(6,6);

% Calculo de Plücker
for i = 1:6
    X_plu(:,:,1,i) = plucker(th_i(1,i),'y',cero);
    X_plu(:,:,2,i) = plucker(th_i(2,i),'x',cero);
    d = lmin*lambda(:,i);
    X_plu(:,:,3,i) = plucker(0,'z',d);
    d1 = (th_i(3,i) - lmin)*lambda(:,i);
    X_plu(:,:,4,i) = plucker(th_i(4,i),'z',d1);
    X_plu(:,:,5,i) = plucker(th_i(5,i),'x',cero);
    X_plu(:,:,6,i) = plucker(th_i(6,i),'y',cero);
end

% Calculo de los jacobianos
% Movimiento SCREW
Sj(5,1,1) = 1;
Sj(4,2,2) = 1;
Sj(3,3,3) = 1;
Sj(6,4,4) = 1;
Sj(4,5,5) = 1;
Sj(5,6,6) = 1;

for i = 1:6
    J(:,:,1,i) = X_plu(:,:,1,i)*J0 + Sj(:,:,1);
    J(:,:,2,i) = X_plu(:,:,2,i)*J(:,:,1,i) + Sj(:,:,2);
    J(:,:,3,i) = X_plu(:,:,3,i)*J(:,:,2,i) + Sj(:,:,3);
    J(:,:,4,i) = X_plu(:,:,4,i)*J(:,:,3,i) + Sj(:,:,4);
    J(:,:,5,i) = X_plu(:,:,5,i)*J(:,:,4,i) + Sj(:,:,5);
    J(:,:,6,i) = X_plu(:,:,6,i)*J(:,:,5,i) + Sj(:,:,6);
end

for i = 1:6
t_dot(:,i) = J(:,:,6,i)\twist_p;        % El operador sugerido por matlab para realizar la solucion de inv(J)
end


end