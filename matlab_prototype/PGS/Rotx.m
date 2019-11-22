%% Funcion para rotar sobre el eje y un vector
function vRot = Rotx(angleDeg,type)
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

Rx = [1,0,0;
      0,cos(theta),-sin(theta);
      0,sin(theta),cos(theta)];

vRot = Rx;
end