%----------------programa creado con el proposito de generar el video demostrativo
clear;%limpia el workspace
clc;%limpia el command window
R1=1;%radio de la base
R2=R1/1.618;%radio de la plataforma
Lmin=1;%longitud m�nima de los actuadores
B=[0 0 0]';%ubicaci�n del centro dela base
rho=1.618*3;%proporcion entre los angulos de los pistones
%--------------------------------------------------------------------------
t=linspace(0,720,300);%2 ciclos divididos en 300 puntos
r=0.3;%radio de la trayectoria a describir
amp=15;%amplitud del balanceo [grados]
px=r*sind(t);%generar vector de posiciones en x
py=r*cosd(t);%generar vector de posiciones en y
ox=amp*sind(t);%generar vector de �ngulos de orientaci�n en x
oy=amp*cosd(t);%generar vector de �ngulos de orientaci�n en y
for n=1:size(t,2)%for para calcular 2 ciclos de la trayectoria dividida en 300 puntos
    P=[px(n) py(n) 1.2]';%generar el vector de posici�n para el instante dado
    or=[ox(n) oy(n) 0];%generar el vector de orientaci�n para el instante dado
    STWRT_snapshot(R1,R2,Lmin,B,rho,P,or,n);%funcion para calcular todos los vectores y generar gr�fico a partir de los par�metros, posici�n y orientaci�n dados
    view(40,40);%ajuste de la perspectiva del gr�fico 40� azimut 40� elevaci�n
    xlim([-1.2 1.2]);%establecer los l�mites para el eje x del gr�fico
    ylim([-1.2 1.2]);%establecer los l�mites para el eje y del gr�fico
    zlim([0 2]);%establecer los l�mites para el eje z del gr�fico
    pelicula(n) = getframe(gca);%guarda el gr�fico actual en un vector de im�genes la im�gen en el instante "n"
    clf%limpia la gr�fica
end
myWriter = VideoWriter('mixto','MPEG-4');%crea el objeto escritor de video indicando el nombre del video a crear y el formato
myWriter.FrameRate = 60;%define cu�ntos fotogramas por segundo tendr� el video
open(myWriter);%abre el objeto escritor de video
writeVideo(myWriter,pelicula);%crea el video
close(myWriter);%cierra el escritor