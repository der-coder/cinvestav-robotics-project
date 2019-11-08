function [I] = inertiaTensorPointMass(mass, point, reference)
x = point(1) - reference(1);
y = point(2) - reference(2);
z = point(3) - reference(3);


ixx = y^2 + z^2;
iyy = x^2 + z^2;
izz = x^2 + y^2;

ixy = -x*y; 
ixz = -x*z;
iyz = -y*z;

iyx = ixy;
izx = ixz;
izy = iyz;

I = mass*[ixx,ixy, ixz; iyx, iyy, iyz; izx, izy, izz];
end