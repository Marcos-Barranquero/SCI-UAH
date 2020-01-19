%Tiempo de muestreo
Ts=100e-3
% Referencia x-y de posicion
refx=-1
refy=3

% Ejecutar Simulacion
sim('PositionControl.slx')
% Mostrar
x=salida_x.signals.values;
y=salida_y.signals.values;
figure;
plot(x,y);
grid on;
hold on; 