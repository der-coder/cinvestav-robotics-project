function [X_plu, J,t_dot] = p_IVK(th_i,anga,angb,a,b,R_rpy,lam,dPist,twist_p)

HT_b = zeros(4,4,6);
HT_a = zeros(4,4,6);
for i = 1:6
    HT_b(:,:,i) = [Rotz(angb(i) + (pi/2)), b(:,i); 0,0,0,1];
    ht_a = [Rotz(-anga(i) - (pi/2)), zeros(3,1); 0,0,0,1];
    ht_aa = [eye(3), -R_rpy*a(:,i); 0,0,0,1];
    HT_a(:,:,i) = ht_a*ht_aa;
end

% TH(:,:,:,1) = hom_Trans(th_i(:,1),dPist);
% TH(:,:,:,2) = hom_Trans(th_i(:,2),dPist);
% TH(:,:,:,3) = hom_Trans(th_i(:,3),dPist);
% TH(:,:,:,4) = hom_Trans(th_i(:,4),dPist);
% TH(:,:,:,5) = hom_Trans(th_i(:,5),dPist);
% TH(:,:,:,6) = hom_Trans(th_i(:,6),dPist);

% Calculo de Plücker
X_plu = zeros(6,6,6,6);
cero = [0,0,0];
for i = 1:6
    X_plu(:,:,1,i) = plucker(th_i(1,i),'y',cero);
    X_plu(:,:,2,i) = plucker(th_i(2,i),'x',cero);
    d = dPist*lam(:,i);
    X_plu(:,:,3,i) = plucker(0,'z',d);
    d1 = (th_i(3,i) - dPist)*lam(:,i);
    X_plu(:,:,4,i) = plucker(th_i(4,i),'z',d1);
    X_plu(:,:,5,i) = plucker(th_i(5,i),'x',cero);
    X_plu(:,:,6,i) = plucker(th_i(6,i),'y',cero);
end

% Calculo de los jacobianos
J0 = zeros(6,6);
J = zeros(6,6,6,6);
Sj = zeros(6,6,6);
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
t_dot = zeros(6,6);
for i = 1:6
t_dot(:,i) = J(:,:,6,i)\twist_p;
end
end