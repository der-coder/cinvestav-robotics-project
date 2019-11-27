function [M] = massTensor(mass, inertiaTensorCenterMass, distanceCenterMass)
% Obtains the mass tensor of inertia for the given element

x = distanceCenterMass(1);
y = distanceCenterMass(2);
z = distanceCenterMass(3);
cpo_r = [0,-z,y;z,0,-x;-y,x,0];

m11 = mass * eye(3);
m12 = - mass * cpo_r;
m21 = mass * cpo_r;
m22 = inertiaTensorCenterMass - mass * cpo_r * cpo_r;

M = [m11,m12;m21,m22];
end
