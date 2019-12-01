% Comparacion Energética
clc
clear

load('E_PD.mat')
load('E_PID.mat')
load('E_PDpG.mat')

figure(1)
plot(en_PD.Time,en_PD.Data,'k',en_PID.Time,en_PID.Data,'k--',en_PDpG.Time,en_PDpG.Data,'k-.', 'linewidth', 2)
set(gca,'FontSize',30)
grid on
title('Comparación energética de la PG a un patron','fontsize',30)
xlabel('Tiempo [ $s$ ]','interpreter','latex')
ylabel('Trabajo [ $j$ ]','interpreter','latex')
legend({'PD','PID','PD + G'},'location','southeast','fontsize',30)

figure(2)
subplot(3,1,1)
plot(en_PD.Time,en_PD.Data,'k', 'linewidth', 2)
title('Comparación energética de la PG a un patron','fontsize',34)
set(gca,'FontSize',24)
grid on
xlabel('Tiempo [ $s$ ]','interpreter','latex')
ylabel('Trabajo [ $j$ ]','interpreter','latex')

subplot(3,1,2)
plot(en_PID.Time,en_PID.Data,'k', 'linewidth', 2)
set(gca,'FontSize',24)
grid on
xlabel('Tiempo [ $s$ ]','interpreter','latex')
ylabel('Trabajo [ $j$ ]','interpreter','latex')

subplot(3,1,3)
plot(en_PDpG.Time,en_PDpG.Data,'k', 'linewidth', 2)
set(gca,'FontSize',24)
grid on
xlabel('Tiempo [ $s$ ]','interpreter','latex')
ylabel('Trabajo [ $j$ ]','interpreter','latex')