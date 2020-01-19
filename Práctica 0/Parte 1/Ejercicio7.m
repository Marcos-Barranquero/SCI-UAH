%function[sol, reales, complejas] = raices(poli_1, poli_2)


% Funci�n para obtener raices de un producto de polinomios y las clasifique
% en reales y complejas.
function [solucion, nReales, nComplejas] = Ejercicio7(poli_1, poli_2)

% Inicializo variables
nReales = 0;
nComplejas = 0;

% Calculo el producto de polinomios
productoPolinomios = conv(poli_1, poli_2);

% Doy a elegir polinomio:
disp("p1 = Polinomio 1: ")
disp(poli_1);
disp("p2 = Polinomio 2: ");
disp(poli_2);
disp("pp = Polinomio producto: ");
disp(productoPolinomios);


eleccion = input('�Sobre qu� polinomio se aplicar� soluci�n?: ', 's');

% Establezco polinomio a solucionar
switch eleccion
    case 'p1'
        polinomio = poli_1;
    case 'p2'
        polinomio = poli_2;
    case 'pp'
        polinomio = productoPolinomios;
end


% Obtengo raices polinomio
solucion = roots(polinomio);

% Cuento soluciones reales y complejas
for i = 1:length(solucion)
    % Si es real a�ado a reales
    if isreal(solucion(i))
        nReales = nReales + 1;
        
    % Si es compleja, a�ado a complejas
    else
        nComplejas = nComplejas + 1;
    end
end

% Imprimo por pantalla
disp("N� de  raices reales: " + nReales);

disp("N� de  raices compleas: " + nComplejas);

end












