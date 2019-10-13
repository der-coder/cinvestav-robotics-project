function [alerta,pelicula] = balanceo1(R1,R2,Lmin,r,nPuntos,grafico)
%[alerta,pelicula] = balanceo1(R1,R2,Lmin,r,nPuntos,grafico)
%entrega una alerta indicando la factibilidad de la trayectoria y un vector
%de imágenes correspondientes al movimiento de balanceo para la plataforma 
%gough-stewart 
%   R1 es el radio de la base 
%   R2 es el radio de la plataforma
%   Lmin es la longitud mínima de los cilindros
%   r es el radio que describirá la trayectoria [m]
%   nPuntos es el numero de puntos por ciclo que se calcularán
%   grafico es un handle al gráfico que se usara para dibujar y posteriormente capturar las imágenes.
B=[0 0 0]';%ubicación del centro dela base
rho=1.618*3;%proporcion entre los angulos de los pistones
or = [0 0 0];%inicializa el vector de orientación
t=linspace(0,360,nPuntos);%1 ciclo dividido en "nPuntos"
px=r*sind(t);%generar vector de posiciones en x
py=r*cosd(t);%generar vector de posiciones en y
f = waitbar(0,'Calculando trayectoria...');%creación de la barra de avance
for n=1:size(t,2)%for para calcular los puntos de la trayectoria
    P=[px(n) py(n) Lmin]';%generar el vector de posición para el instante dado
    set(0, 'CurrentFigure', grafico);%cambia el handle al gráfico de trabajo
    alerta = STWRT_snapshot1(R1,R2,Lmin,B,rho,P,or);%funcion para calcular todos los vectores y generar gráfico a partir de los parámetros, posición y orientación dados
    view(40,40);%ajuste de la perspectiva del gráfico 40° azimut 40° elevación
    xlim([-1.2*R1 1.2*R1]);%establecer los límites para el eje x del gráfico
    ylim([-1.2*R1 1.2*R1]);%establecer los límites para el eje y del gráfico
    zlim([0 2.2*Lmin]);%establecer los límites para el eje z del gráfico
    pelicula(n) = getframe(gca);%guarda el gráfico actual en un vector de imágenes la imágen en el instante "n"
    clf;%limpia la gráfica
    avance=n/nPuntos;%calcula el progreso total
    waitbar(avance,f,'Calculando trayectoria...');%actualiza en la barra de avance el progreso
end
close(f);%cierra la barra de avance
end

