clc
clear

% Referencia 
load('t_PD.mat')

tPD = tout.Data;
w = (2*pi)/10;                 % Frecuencia de 1/5 Hz
r = .1;                       % Radio movimiento

x = r*cos(w*tPD);               % Posicion x
y = r*sin(w*tPD);               % Posicion y
z = 1.5*ones(length(tPD),1);                      % Posicion z
ang = zeros(length(tPD),3);                % Posicion angular

load('pose_PD.mat')

RefPD = [x,y,z,ang];

ePD = abs(pose.Data - RefPD);

figure(1)
plot(tPD,ePD,'linewidth',2)
set(gca,'FontSize',30)
grid on
title('Error del control PD en una ruta de movimiento','fontsize',34)
xlabel('Tiempo [ $s$ ]','interpreter','latex')
ylabel('error','interpreter','latex')
legend({'x [m]','y [m]','z [m]','$\phi$ [rad]','$\theta$ [rad]','$\psi$ [rad]'},'interpreter','latex','location','northeast','fontsize',30)

plot(tPD,pose.DATA(:,1:3),'linewidth',2)
set(gca,'FontSize',30)
% title('Posicion de la PG en control PD','fontsize',34)
xlabel('Tiempo [ $s$ ]','interpreter','latex')
ylabel('Posición','interpreter','latex')
legend({'x [m]','y [m]','z [m]'},'interpreter','latex','location','southeast','fontsize',30)
grid on

%%
load('t_PDpG.mat')

tPDpG = tout.Data;
w = (2*pi)/10;                 % Frecuencia de 1/5 Hz
r = .1;                       % Radio movimiento

x = r*cos(w*tPDpG);               % Posicion x
y = r*sin(w*tPDpG);               % Posicion y
z = 1.5*ones(length(tPDpG),1);                      % Posicion z
ang = zeros(length(tPDpG),3);                % Posicion angular

RefPDpG = [x,y,z,ang];

load('pose_PDpG.mat')

ePDpG = abs(pose.Data - RefPDpG);

figure(2)
plot(tPDpG,ePDpG,'linewidth',2)
set(gca,'FontSize',30)
grid on
title('Error del control PD+G en una ruta de movimiento','fontsize',34)
xlabel('Tiempo [ $s$ ]','interpreter','latex')
ylabel('error','interpreter','latex')
legend({'x [m]','y [m]','z [m]','$\phi$ [rad]','$\theta$ [rad]','$\psi$ [rad]'},'interpreter','latex','location','northeast','fontsize',30)

plot(tPDpG,pose.DATA(:,1:3),'linewidth',2)
set(gca,'FontSize',30)
% title('Posicion de la PG en control PD+G','fontsize',34)
xlabel('Tiempo [ $s$ ]','interpreter','latex')
ylabel('Posición','interpreter','latex')
legend({'x [m]','y [m]','z [m]'},'interpreter','latex','location','southeast','fontsize',30)
grid on

%%
load('t_PID.mat')

tPID = tout.Data;
w = (2*pi)/10;                 % Frecuencia de 1/5 Hz
r = .1;                       % Radio movimiento

x = r*cos(w*tPID);               % Posicion x
y = r*sin(w*tPID);               % Posicion y
z = 1.5*ones(length(tPID),1);                      % Posicion z
ang = zeros(length(tPID),3);                % Posicion angular

load('pose_PID.mat')
RefPID = [x,y,z,ang];

ePID = abs(pose.Data - RefPID);

figure(3)
plot(tPID,ePID,'linewidth',2)
set(gca,'FontSize',30)
grid on
title('Error del control PID en una ruta de movimiento','fontsize',34)
xlabel('Tiempo [ $s$ ]','interpreter','latex')
ylabel('error','interpreter','latex')
legend({'x [m]','y [m]','z [m]','$\phi$ [rad]','$\theta$ [rad]','$\psi$ [rad]'},'interpreter','latex','location','northeast','fontsize',30)

plot(tPID,pose.DATA(:,1:3),'linewidth',2)
set(gca,'FontSize',30)
% title('Posicion de la PG en control PID','fontsize',34)
xlabel('Tiempo [ $s$ ]','interpreter','latex')
ylabel('Posición','interpreter','latex')
legend({'x [m]','y [m]','z [m]'},'interpreter','latex','location','southeast','fontsize',30)
grid on


