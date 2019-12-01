function R = ROT(ang,eje,tipo)
%Se obtiene la matriz de rotacion en el eje x, y o z según se especifique
%tanto en grados como en radianes.
%
% En casod e no especificar tipo, asume el ángulo esta en radianes
%
%   R = rot(ang,ejer,tipo)
% 
%   ang  - ángulo de rotación
%   eje  - eje de la rotación 'x','y' o 'z'
%   tipo - tipo de dato del ángulo 'g' -> grados 'r' -> radianes

switch nargin
  case 2
    if strcmp(eje,'x')
      R = rotx(ang);
    end
    if strcmp(eje,'y')
      R = roty(ang);
    end
    if strcmp(eje,'z')
      R = rotz(ang);
    end
  case 3
    if strcmp(tipo,'g') || strcmp(tipo,'d') || strcmp(tipo,'G') || strcmp(tipo,'D')
      ang = deg2rad(ang);
    end
    if strcmp(eje,'x')
      R = rotx(ang);
    end
    if strcmp(eje,'y')
      R = roty(ang);
    end
    if strcmp(eje,'z')
      R = rotz(ang);
    end
end

  function Rx = rotx(theta)
    Rx = [1,0,0;
      0,cos(theta),-sin(theta);
      0,sin(theta),cos(theta)];
  end
  function Ry = roty(theta)
    Ry = [cos(theta),0,sin(theta);
      0,1,0;
      -sin(theta),0,cos(theta)];
  end
  function Rz = rotz(theta)
    Rz = [cos(theta),-sin(theta),0;
      sin(theta),cos(theta),0;
      0,0,1];
  end

end