clear all; close all;

% Inicializamos las variables necesarias para el sistema
Ts = 0.1;

x_0 = 0;
y_0 = 0;
th_0 = 0;

% Hacemos la simulacion
sim('TrajectoryControl.slx');

% Recogemos los datos de trayectoria que envia el modelo desde simulink
trayectoria_x = salida_xref.signals.values';
trayectoria_y = salida_yref.signals.values';

x = salida_x.signals.values';
y = salida_y.signals.values';

% Pintamos ambas trayectorias en un figure
figure(1);
hold on;
tray_original = plot(trayectoria_x, trayectoria_y);
tray_robot = plot(x, y);
hold off;
grid on;
legend([tray_original tray_robot], {'Trayectoria generada', 'Trayectoria robot'});
title('Comparativa de las trayectorias');
