%% Funcion para rotar sobre el eje z un vector
function vRot = Rotz(angleDeg,type)
switch nargin
    case 2
        if strcmp(type,'d')
            theta = deg2rad(angleDeg);
        end
        if strcmp(type,'r')
            theta = angleDeg;
        else
            disp('Variable no posible')
        end
    case 1
        theta = angleDeg;
end

Rz = [cos(theta),-sin(theta),0;
    sin(theta),cos(theta),0;
    0,0,1];

vRot = Rz;
end