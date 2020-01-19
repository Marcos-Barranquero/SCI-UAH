clear all;

% Pido matriz A

dim_A = input("Dame dimensiones para matriz A: ")
entrada_A = input("�Quieres que la matriz A sea aleatoria? (S/N): ", 's')

if entrada_A == "S"
    aleatorio = true;
else
    aleatorio = false;
end

if length(dim_A) == 1
    A = zeros(dim_A);

elseif length(dim_A) == 2
    disp("Matriz normal")
    A = zeros(dim_A(1), dim_A(2));
else
    return
end

% Para la matriz B es idéntico.

A = introducirMatriz(A, aleatorio);

% Pido matriz B

entrada_B = input("�Quieres que la matriz B sea aleatoria? (S/N): ", 's')

if entrada_B == "S"
    aleatorio = true;
else
    aleatorio = false;
end

if length(dim_A) == 1
    B = zeros(dim_A);

elseif length(dim_A) == 2
    disp("Matriz normal")
    B = zeros(dim_A(1), dim_A(2))
else
    return
end

B = introducirMatriz(B, aleatorio)

% Muestro datos pedidos para A:

disp("Matriz A: ")
disp(A)
disp("Matriz A transpuesta: ")
disp(A')
disp("Matriz A inversa: ")
disp(inv(A))
disp("Determinante A: ")
disp(det(A))
disp("Rango A: ")
disp(rank(A))

% Muestro datos pedidos para A:

disp("Matriz B: ")
disp(B)
disp("Matriz B transpuesta: ")
disp(B')
disp("Matriz B inversa: ")
disp(inv(B))
disp("Determinante B: ")
disp(det(B))
disp("Rango B: ")
disp(rank(B))

% Producto de A * B

C = A * B
disp("Matriz C = A * B")
disp(C)

disp("Matriz D resultado de multiplicar elemento a elemento. ")
D = times(A, B)

suma_columnas = A(:, 1) + B(:, 1)
disp("Primera columna concatenada: ")
disp(suma_columnas)

function [matriz] = introducirMatriz(matriz, aleatorio)
    [filas, columnas] = size(matriz)
    disp("Filas: "+filas)
    disp("Columnas: "+columnas)

    for fila = 1:filas

        for columna = 1:columnas

            if aleatorio
                matriz(fila, columna) = randi([1, 100])
            else
                cadena = "Dame posici?n ["+fila + "]["+columna + "]: "
                disp(cadena)
                matriz(fila, columna) = input(' ');
            end

        end

    end

end
