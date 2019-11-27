function x = plucker(ang,eje,d)
R = zeros(6,6);
T = eye(6);
n = length(d);
if n ~= 3
    disp("d debe de ser de dimensión 3")
end
switch nargin
    case 3
        if strcmp(eje,'x')
            R(1:3,1:3) = Rotx(ang);
            R(4:6,4:6) = Rotx(ang);
        end
        if strcmp(eje,'y')
            R(1:3,1:3) = Roty(ang);
            R(4:6,4:6) = Roty(ang);
        end
        if strcmp(eje,'z')
            R(1:3,1:3) = Rotz(ang);
            R(4:6,4:6) = Rotz(ang);
        end
        k = [0,-d(3),d(2);d(3),0,-d(1);-d(2),d(1),0];
        T(1:3,4:6) = k;
        x = R*T;
    otherwise
        disp("Faltan datos")
end

end