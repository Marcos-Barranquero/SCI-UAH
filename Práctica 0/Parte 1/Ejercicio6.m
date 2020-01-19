%Creacion de las matrices 

% Primer sistema de ecuaciones
A1 = zeros(10,4);
A1(1,:)  = [0 2 10 7];
A1(2,:)  = [2 7 7 1];
A1(3,:)  = [1 9 0 5];
A1(4,:)  = [4 0 0 6];
A1(5,:)  = [2 8 4 1];
A1(6,:)  = [10 6 0 3];
A1(7,:)  = [2 6 4 0];
A1(8,:)  = [1 1 9 3];
A1(9,:)  = [6 4 8 2];
A1(10,:) = [0 3 0 9];

% Soluciones
b1 = [90 ; 59 ; 15 ; 10 ; 80 ; 17 ; 93 ; 51 ; 41 ; 76];

% Segundo sistema de ecuaciones
A2 = zeros(10,4);
A2(1,:)  = [0.110 0 1 0];
A2(2,:)  = [0 3.260 0 1];
A2(3,:)  = [0.425 0 1 0];
A2(4,:)  = [0 3.574 0 1];
A2(5,:)  = [0.739 0 1 0];
A2(6,:)  = [0 3.888 0 1];
A2(7,:)  = [1.054 0 1 0];
A2(8,:)  = [0 4.202 0 1];
A2(9,:)  = [1.368 0 1 0];
A2(10,:) = [0 4.516 0 1];

% Soluciones
b2 = [317 ; 237 ; 319 ; 239 ; 321 ; 241 ; 323 ; 243 ; 325 ; 245];

% Apartados

% a) condiciones de A respecto a la inversi�n
condicionesA1 = cond(A1);
cadenaA1 = sprintf("a) Condiciones sobre la matriz A1: %i", condicionesA1);
disp(cadenaA1);

% a2) condiciones de A2 respecto a la inversi�n
condicionesA2 = cond(A2);
cadenaA2 = sprintf("a) Condiciones sobre la matriz A2: %i", condicionesA2);
disp(cadenaA2);

% b) Resolver para obtener matriz x = [x1, x2, x3, x4]
% Resuelvo A1
linSolveA1 = linsolve(A1,b1);
disp("b) Soluci�n para A1: ");
disp(linSolveA1);

% Resuelvo A2
linSolveA2 = linsolve(A2,b2);
disp("b) Soluci�n para A2: ");
disp(linSolveA2);

% Guardo valores para apartado c)
pinvA1 = pinv(A1)*b1;
pinvA2 = pinv(A2)*b2;


% c) A�adir ruido sumando vector aleatorio y resoluci�n de ecuaciones
% resultante.

% Extraigo filas y columnas
[nFilasA1, nColumnasA1] = size(b1);
[nFilasA2, nColumnasA2] = size(b2);

% Calculo ruido
ruidoB1     = rand(nFilasA1, nColumnasA1)*1+0;
ruidoB2     = rand(nFilasA2, nColumnasA2)*1+0;

% Lo a�ado a los vectores de t�rminos independientes:
b1           = b1 + ruidoB1;
b2           = b2 + ruidoB2;

% Resuelvo A1 con linsolve
linsolveA1R   = linsolve(A1,b1);

% Resuelvo A2 con linsolve
linsolveA2R = linsolve(A2,b2);

% Resuelvo A1 y A2 con pinv
pinvA1R  = pinv(A1)*b1;
pinvA2R  = pinv(A2)*b2;

%Apartado c



disp("c) C�lculos con Pinv: ");

disp("A1: ");
disp(pinvA1);

disp("A1 (Ruido): ");
disp(pinvA1R);

disp("A2: ");
disp(pinvA2);

disp("A2 (Ruido): ");
disp(pinvA2R);

disp("---------------------------------")

disp("c) C�lculos con Linsolve: ");
disp("A1: ");
disp(linSolveA1);
disp("A1 (Ruido): ");
disp(linsolveA1R);

disp("A2: ");
disp(linSolveA2);

disp("A2 (Ruido): ");
disp(linsolveA2R);
