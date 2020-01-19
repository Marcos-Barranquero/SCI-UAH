clear all; close all;

% Inicializamos las variables necesarias para el sistema
Ts = 0.1;

x_0 = 0;
y_0 = 0;
th_0 = 0;

% Simulamos con el robot
sim('TrajectoryControl.slx');

% Recogemos los datos de trayectoria que envia el modelo desde simulink
trayectoria_x = salida_xref.signals.values';
trayectoria_y = salida_yref.signals.values';

x_robot = salida_x.signals.values';
y_robot = salida_y.signals.values';

% Simulamos con la red neuronal
sim('TrajectoryControlNet.slx');

x_net = salida_x.signals.values';
y_net = salida_y.signals.values';

% Pintamos ambas trayectorias en un figure
figure(1);
hold on;
tray_original = plot(trayectoria_x, trayectoria_y);
tray_robot = plot(x_robot, y_robot);
tray_net = plot(x_net, y_net);
hold off;
grid on;
legend([tray_original tray_robot tray_net], {'Trayectoria generada', 'Trayectoria robot', 'Trayectoria net'});
title('Comparativa de las trayectorias');
