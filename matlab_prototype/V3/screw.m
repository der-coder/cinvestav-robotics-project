%----------------programa creado con el proposito de generar el video demostrativo
clear;%limpia el workspace
clc;%limpia el command window
R1=1;%radio de la base
R2=R1/1.618;%radio de la plataforma
Lmin=1;%longitud m�nima de los actuadores
B=[0 0 0]';%ubicaci�n del centro dela base
rho=1.618*3;%proporcion entre los angulos de los pistones
%--------------------------------------------------------------------------
t=linspace(275,635,300);%1 ciclo divididos en 300 puntos
h=1.2+(0.2*sind(t));%definir el recorrido en el eje z
az=30+(30*sind(t));%definir el recorrido de la rotaci�n al rededor del eje z
for n=1:size(t,2)%for para calcular 1 ciclo de la trayectoria dividida en 300 puntos
    P=[0 0 h(n)]';%generar el vector de posici�n para el instante dado
    or=[0 0 az(n)];%generar el vector de orientaci�n para el instante dado
    STWRT_snapshot(R1,R2,Lmin,B,rho,P,or,n);%funcion para calcular todos los vectores y generar gr�fico a partir de los par�metros, posici�n y orientaci�n dados
    view(40,40);%ajuste de la perspectiva del gr�fico 40� azimut 40� elevaci�n
    xlim([-1.2 1.2]);%establecer los l�mites para el eje x del gr�fico
    ylim([-1.2 1.2]);%establecer los l�mites para el eje y del gr�fico
    zlim([0 2]);%establecer los l�mites para el eje z del gr�fico
    pelicula(n) = getframe(gca);%guarda el gr�fico actual en un vector de im�genes la im�gen en el instante "n"
    clf%limpia la gr�fica
end
myWriter = VideoWriter('screw','MPEG-4');%crea el objeto escritor de video indicando el nombre del video a crear y el formato
myWriter.FrameRate = 60;%define cu�ntos fotogramas por segundo tendr� el video
open(myWriter);%abre el objeto escritor de video
writeVideo(myWriter,pelicula);%crea el video
close(myWriter);%cierra el escritor