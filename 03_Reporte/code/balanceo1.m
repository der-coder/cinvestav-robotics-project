function [alerta,pelicula] = balanceo1(R1,R2,Lmin,r,nPuntos,grafico)
%[alerta,pelicula] = balanceo1(R1,R2,Lmin,r,nPuntos,grafico)
%entrega una alerta indicando la factibilidad de la trayectoria y un vector
%de im�genes correspondientes al movimiento de balanceo para la plataforma 
%gough-stewart 
%   R1 es el radio de la base 
%   R2 es el radio de la plataforma
%   Lmin es la longitud m�nima de los cilindros
%   r es el radio que describir� la trayectoria [m]
%   nPuntos es el numero de puntos por ciclo que se calcular�n
%   grafico es un handle al gr�fico que se usara para dibujar y posteriormente capturar las im�genes.
B=[0 0 0]';%ubicaci�n del centro dela base
rho=1.618*3;%proporcion entre los angulos de los pistones
or = [0 0 0];%inicializa el vector de orientaci�n
t=linspace(0,360,nPuntos);%1 ciclo dividido en "nPuntos"
px=r*sind(t);%generar vector de posiciones en x
py=r*cosd(t);%generar vector de posiciones en y
f = waitbar(0,'Calculando trayectoria...');%creaci�n de la barra de avance
for n=1:size(t,2)%for para calcular los puntos de la trayectoria
    P=[px(n) py(n) Lmin]';%generar el vector de posici�n para el instante dado
    set(0, 'CurrentFigure', grafico);%cambia el handle al gr�fico de trabajo
    alerta = STWRT_snapshot1(R1,R2,Lmin,B,rho,P,or);%funcion para calcular todos los vectores y generar gr�fico a partir de los par�metros, posici�n y orientaci�n dados
    view(40,40);%ajuste de la perspectiva del gr�fico 40� azimut 40� elevaci�n
    xlim([-1.2*R1 1.2*R1]);%establecer los l�mites para el eje x del gr�fico
    ylim([-1.2*R1 1.2*R1]);%establecer los l�mites para el eje y del gr�fico
    zlim([0 2.2*Lmin]);%establecer los l�mites para el eje z del gr�fico
    pelicula(n) = getframe(gca);%guarda el gr�fico actual en un vector de im�genes la im�gen en el instante "n"
    clf;%limpia la gr�fica
    avance=n/nPuntos;%calcula el progreso total
    waitbar(avance,f,'Calculando trayectoria...');%actualiza en la barra de avance el progreso
end
close(f);%cierra la barra de avance
end

