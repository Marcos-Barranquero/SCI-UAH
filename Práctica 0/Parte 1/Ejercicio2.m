clear all;

tamano = input("Dame tamaño de matriz: ");

% Ejercicio 2.1

% Randi hace matrices con numeros aleatorios entre 0 y 100 y tamaño dado.
matriz = randi([0, 100], tamano);

% Ejercicio 2.2
% a)
disp(matriz)

% b) Para construir matrices se puede poner matriz(filas, columnas)
% además, podemos usar inicio:salto:end pa coger filas/columnas de salto en salto
matriz_columnas_impares = matriz(:, 1:3:end);

% c)
diagonal = diag(matriz);

% d)
maximos_fila = max(matriz);
minimos_fila = min(matriz);
medio_fila = mean(matriz);
varianza_fila = var(matriz);

figure(1)
title("Datos")
hold on
plot(maximos_fila)
plot(minimos_fila)
plot(medio_fila)
plot(varianza_fila)
legend('maximos', 'minimos', 'media', 'varianza')

hold off

maximo = max(max(matriz)); % max(vector de maximos de cada columna)
minimo = min(min(matriz));
medio = mean(mean(matriz));
varianza = var(matriz);

