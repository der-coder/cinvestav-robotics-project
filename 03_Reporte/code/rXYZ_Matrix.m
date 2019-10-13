function [R] = rXYZ_Matrix(ax,ay,az)
%R] = rXYZ_Matrix(ax,ay,az) entrega la matriz de rotación R según los
%ángulos de rotación [grados]
%   ax es el ángulo de rotacion en el eje x
%   ay es el ángulo de rotacion en el eje y
%   az es el ángulo de rotacion en el eje z
ax=ax*(2*pi/360);%convertir de grados a radianes
ay=ay*(2*pi/360);%convertir de grados a radianes
az=az*(2*pi/360);%convertir de grados a radianes
aa=ax;%cambio del nombre de variable
ab=ay;%cambio del nombre de variable
ac=az;%cambio del nombre de variable
R=[                cos(ab)*cos(ac)               -cos(ab)*sin(ac)                                   sin(ab);
    (sin(aa)*sin(ab)*cos(ab))+(cos(aa)*sin(ac)) -(sin(aa)*sin(ab)*sin(ac))+(cos(aa)*cos(ac)) -(sin(aa)*cos(ab));
    -(cos(aa)*sin(ab)*cos(ac))                     (cos(aa)*sin(ab)*sin(ac))+(sin(aa)*cos(ac)) cos(aa)*cos(ab)];%obtención de la matriz de rotación
end

