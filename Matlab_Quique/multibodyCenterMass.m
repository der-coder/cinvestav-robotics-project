function [cm] = multibodyCenterMass(points, masses)
% Obtain the center of mass for the system, assuming all are point masses
% Result is measured with respect to the origin (0,0,0) 
% at the inertial frame
% The points matrix is a 3 x n matrix containing the x,y,z coordinates 
% of the point masses
% masses is a column vector containing the scalar value of each body

totalMass = sum(masses);

x_bar = dot(points(1,:),masses')/totalMass;
y_bar = dot(points(2,:),masses')/totalMass;
z_bar = dot(points(3,:),masses')/totalMass;

cm = [x_bar; y_bar; z_bar];
end