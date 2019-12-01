function [q,lambda] = IK(d,R,a,b)
%% Prealocación de variables
l = zeros(3,6);
q = zeros(6,1);
lambda = zeros(3,6);

% Matriz de rotacion de la plataforma
Rot = ROT(R(3),'z','r')*ROT(R(2),'y','r')*ROT(R(1),'x','r');

for i = 1:6
  l(:,i) = d + Rot*a(:,i) - b(:,i);
  q(i)=norm(l(:,i));
  lambda(:,i)=(l(:,i))/(q(i));
end

end