clear all; close all;
%Tiempo de muestreo
Ts=100e-3
% Referencia x-y de posicion
refx=5
refy=0
obsx = 3
obsy = 0
% Ejecutar Simulacion
sim('PositionControl.slx')
% Mostrar
x=salida_x.signals.values;
y=salida_y.signals.values;
figure;
hold on;
tray_original = plot(x,y);
tray_roca = plot(obsx, obsy, 'x');
grid on;
hold off; 
legend([tray_original tray_roca], {'Trayectoria', 'Roca'});
title('Trayectoria del robot');