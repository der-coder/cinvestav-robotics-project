function [mass, distanceCenterMass, inertiaTensorCenterMass, massTensor] = createMovingPiston()
% Returns mass, inertia tensor, distance to center of mass from Sigma 1, and mass tensor for the piston

mass = 0.001 * 2254.14; % mass converted to kilograms
distanceCenterMass = 0.001 * [0.01; 0; -536.96] ; % distance vector in meters

r = distanceCenterMass;

convertGramMM2toKgM2 = (1/1000)*(1/(1000^2)); 


Px = convertGramMM2toKgM2 * 297124.48;
Py = convertGramMM2toKgM2 * 205340128.62;
Pz = convertGramMM2toKgM2 * 205340128.62;

Ix = [0; 0; 1];
Iy = [0.71; -0.71; 0];
Iz = [0.71; 0.71; 0];

I=abs(Px*Ix)+abs(Py*Iy)+abs(Pz*Iz);

r_cpo = CPO(r);

inertiaTensorCenterMass = diag(I);

M1 = mass*eye(3);
M2 = -mass*r_cpo;
M3 = mass*r_cpo;
M4 = diag(I)-(mass*((r_cpo)^2));
massTensor=[M1 M2;
     M3 M4];

end
