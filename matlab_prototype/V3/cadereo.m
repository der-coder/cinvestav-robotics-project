%----------------programa creado con el proposito de generar el video demostrativo
clear;%limpia el workspace
clc;%limpia el command window
R1=1;%radio de la base
R2=R1/1.618;%radio de la plataforma
Lmin=1;%longitud mínima de los actuadores
B=[0 0 0]';%ubicación del centro dela base
rho=1.618*3;%proporcion entre los angulos de los pistones
P=[0 0 1]';%posición de la plataforma
%--------------------------------------------------------------------------
t=linspace(0,720,300);%2 ciclos divididos en 300 puntos
amp=15;%amplitud del balanceo [grados]
ax=amp*sind(t);%generar vector de ángulos de orientación en x
ay=amp*cosd(t);%generar vector de ángulos de orientación en y
for n=1:size(t,2)%for para calcular 2 ciclos de la trayectoria dividida en 300 puntos
    or=[ax(n) ay(n) 0];%generar el vector de orientación para el instante dado
    STWRT_snapshot(R1,R2,Lmin,B,rho,P,or,n);%funcion para calcular todos los vectores y generar gráfico a partir de los parámetros, posición y orientación dados;
    view(40,40);%ajuste de la perspectiva del gráfico 40° azimut 40° elevación
    xlim([-1 1]);%establecer los límites para el eje x del gráfico
    ylim([-1 1]);%establecer los límites para el eje y del gráfico
    zlim([0 2]);%establecer los límites para el eje z del gráfico
    pelicula(n) = getframe(gca);%guarda el gráfico actual en un vector de imágenes la imágen en el instante "n"
    clf%limpia la gráfica
end

myWriter = VideoWriter('cadereo','MPEG-4');%crea el objeto escritor de video indicando el nombre del video a crear y el formato
myWriter.FrameRate = 60;%define cuántos fotogramas por segundo tendrá el video
open(myWriter);%abre el objeto escritor de video
writeVideo(myWriter,pelicula);%crea el video
close(myWriter);%cierra el escritor