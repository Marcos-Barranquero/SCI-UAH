% clear all permite limpiar la memoria de datos de programas anteriores.
clear all;

% Ejercicio 1.1

% Creo matriz A
A = [1 2;
    3 4;
    5 6;
    7 8; ];

% Creo vector V
V = [14; 16; 18; 20]

% Ejercicio 1.2

B = [A V]; % concateno vectores

% Visualizo B
disp(B)

% Ejercicio 1.3 

% Permite copiar partes de matrices. Podemos visualizar
% por consola si no ponemos el ";" al final. 
vector_fila = [B(1, :); B(2, :); B(3, :)]

% Ejercicio 1.4

vector_columna = [B(:, 1); B(:, 2); B(:, 3)]
