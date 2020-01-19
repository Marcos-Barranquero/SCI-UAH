clear all; close all;
%Tiempo de muestreo
Ts=100e-3 

% N valores diferentes de refx/refy
% Warning: se van a generar tantas graficas comparativas de trayectoria 
% como el valor de N (N = 5 -> 5 graficas)

N = 5

array_errores_x = [];
array_errores_y = [];

for i=1:N
    % Generamos los valores aleatorios de refx/refy
    refx=10*rand-5;
    refy=10*rand-5;
    sim('PositionControl.slx') % Simulamos con el sistema original
    x = salida_x.signals.values; % Almacenamos x
    y = salida_y.signals.values; % Almacenamos y

    sim('PositionControlNet.slx') % Simulamos con el sistema con red neuronal
    x_net = salida_x.signals.values; % Almacenamos x
    y_net = salida_y.signals.values; % Almacenamos y

    % Pintamos la grafica resultante comparando ambas trayectorias
    figure(i);
    hold on;
    original = plot(x,y);
    red = plot(x_net, y_net);
    hold off;
    grid on;
    legend([original red], {'Control original', 'Control red neuronal'});

    % Calculamos el error entre ambos valores y lo almacenamos en un array
    % Cogemos la longitud del vector de trayectoria mas pequeño para no
    % calcular el error con elementos que no tengan compañero
    error_parcial_x = [];
    error_parcial_y = [];   
    
    for j=1:min(length(x),length(x_net))
        error_parcial_x = [error_parcial_x ; abs(x(j) - x_net(j))];
        error_parcial_y = [error_parcial_y ; abs(y(j) - y_net(j))];
    end
    
    array_errores_x = [array_errores_x ; error_parcial_x];
    array_errores_y = [array_errores_y ; error_parcial_y];
end

figure(i+1);
plot_errores = plot(array_errores_x, array_errores_y, 'o');
grid on;
title('Valores del error entre ambos controles');
legend(plot_errores, {'Valor del error'});
xlabel('Error en x');
ylabel('Error en y');
