function x = plucker(ang,eje,d)
R = zeros(6,6);
T = eye(6);

switch nargin
    case 3
        if strcmp(eje,'x')
            R(1:3,1:3) = ROT(ang,'x','r');
            R(4:6,4:6) = ROT(ang,'x','r');
        end
        if strcmp(eje,'y')
            R(1:3,1:3) = ROT(ang,'y','r');
            R(4:6,4:6) = ROT(ang,'y','r');
        end
        if strcmp(eje,'z')
            R(1:3,1:3) = ROT(ang,'z','r');
            R(4:6,4:6) = ROT(ang,'z','r');
        end
        k = [0,-d(3),d(2);d(3),0,-d(1);-d(2),d(1),0];
        T(1:3,4:6) = k;
        x = R*T;
    otherwise
        disp("Faltan datos")
end

end