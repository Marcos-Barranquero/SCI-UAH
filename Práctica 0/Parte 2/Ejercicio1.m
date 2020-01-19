syms k a;
% Ejercicio 1.1

% Almacenamos la función en una variable y calculamos su transformada Z
func1 = 2 + 5*k + k^2;
ztrans_func1 = ztrans(func1, k);

% Metemos las variables en arrays de caracteres para poder usarlas en la
% leyenda de la gráfica
char_func1 = sprintf('f(k) = %s', func1);
char_ztrans_func1 = sprintf('f(z) = %s', ztrans_func1);

figure(1);
hold on;
plot1 = ezplot(func1);
ztrans_plot1 = ezplot(ztrans_func1);
hold off;

grid on;
title('Ejercicio 1 - Funciones original y transformada z');
legend([plot1 ztrans_plot1], {char_func1, char_ztrans_func1});

% Ejercicio 1.2

% Almacenamos la función en una variable y calculamos su transformada Z
func2 = sin(k) * exp(-a*k);
ztrans_func2 = ztrans(func2, k);

% Metemos las variables en arrays de caracteres para poder usarlas en la
% leyenda de la gráfica
char_func2 = sprintf('f(k) = %s', func2);
char_ztrans_func2 = sprintf('f(z) = %s', ztrans_func2);

figure(2);
hold on;
plot2 = ezplot(func2);
ztrans_plot2 = ezplot(ztrans_func2);
set(ztrans_plot2, 'Color','r');
hold off;

grid on;
title('Ejercicio 2 - Funciones original y transformada z');
legend([plot2 ztrans_plot2], {char_func2, char_ztrans_func2});

% Ejercicio 1.3

% Creamos la función de transferencia con los valores del enunciado
sys = tf([0.4 0 0], [1 -1 0.1 0.02], 0.1);

figure(3);
sgtitle('Respuestas del sistema:');

hold on;
% Pintamos la respuesta al impulso en un subplot
subplot(2, 1, 1);
impulse(sys);
title('Impulso');

% Pintamos la respuesta a una entrada escalón en un subplot
subplot(2, 1, 2);
step(sys);
title('Entrada escalón');
hold off;