% Aproximaci?n de funciones

% Limpiamos variables
clear all; close all;

% Definimos vectores de entrada y salida.
tiempo = -3:.1:3; % eje de tiempo
funcion_a_aproximar = sinc(tiempo) + 0.001 * randn(size(tiempo)); % funcion que se desea aproximar

% Cargo numero de neuronas de la capa intermedia.
hiddenLayerSize = input('¿Cuantas neuronas de la capa oculta se emplearan?:');

% Pido algoritmo de entrenamiento
algoritmo_entrenamiento = elegir_algoritmo();

% Creo red neuronal
net = fitnet(hiddenLayerSize, algoritmo_entrenamiento);
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

% Y la entreno
net = train(net, tiempo, funcion_a_aproximar);
Y = net(tiempo);

% Realizamos representacion graf ica
hold on;
plot(tiempo, funcion_a_aproximar, '+');
plot(tiempo, Y, '-r');
hold off;
title('Grafica de entrenamiento. ');
xlabel('[P] Entrada');
ylabel('[T] Target');
legend('Funcion real', 'Funcion aproximada')

function eleccion = elegir_algoritmo()
    eleccion = "";

    while true
        disp('1) Descenso por el gradiente.');
        disp('2) Resilient Backpropagation.');
        disp('3) Descenso por el gradiente con inercia.');
        disp('4) Regularizacion bayesiana con propagaci?n de retroceso.');
        numero_algoritmo = input('Seleciona algoritmo de entrenamiento: ');

        switch numero_algoritmo
            case 1
                eleccion = 'traingd';
                break;
            case 2
                eleccion = 'trainrp';
                break
            case 3
                eleccion = 'traingdm';
                break;
            case 4
                eleccion = 'trainbr';
                break;
            otherwise
                disp('Error. Opci?n no valida.');
                break;
        end

    end

end
