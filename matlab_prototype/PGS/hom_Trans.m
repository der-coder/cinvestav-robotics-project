%% Transformaciones homogeneas de la plataforma GOUGH-STEWART
% No toma en cuenta la transformacion de la base a la junta y de la ultima
% junta a la plataforma.
function HT = hom_Trans(theta,dmin)
HT = zeros(4,4,6);
HT(4,4,:) = 1;
switch nargin
    case 2
        n = size(theta,1);
        if n == 1
            theta = theta';
            n = size(theta_ij,1);
        end
        if theta < dmin
            disp(" ")
            disp("No es posible tener valor menor a q")
            return
        end
        if n == 6
            HT(1:3,1:3,1) = Roty(theta(1));
            HT(1:3,1:3,2) = Rotx(theta(2));
            HT(1:3,1:3,3) = Rotz(0);
            HT(3,4,3) = dmin;
            HT(3,4,4) = theta(3) - dmin;
            HT(1:3,1:3,4) = Rotz(theta(4));
            HT(1:3,1:3,5) = Rotx(theta(5));
            HT(1:3,1:3,6) = Roty(theta(6));
        else
            disp(" ")
            disp("Cantidad de datos incorrectos")
        end
    otherwise
        disp(" ")
        disp(" No hay datos suficientes")
end

end