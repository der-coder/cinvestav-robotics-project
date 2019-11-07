function [com] = combinedCenterMass(point1, point2, mass1, mass2)
v = point1 - point2;
masses = mass1 + mass2;
distance = v*(mass2 /masses);
com = point2 + distance;
end