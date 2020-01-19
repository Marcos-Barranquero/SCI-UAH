clear all;
close all;
% Carga de datos de ejemplo disponibles en la toolbox
[inputs, targets] = bodyfat_dataset;

% Creaci�n de la red
hiddenLayerSize = input('¿Cuantas neuronas de la capa oculta se emplearan?:');

% Pido algoritmo de entrenamiento
algoritmo_entrenamiento = elegir_algoritmo();

net = fitnet(hiddenLayerSize, algoritmo_entrenamiento);

% Divisi�n del conjunto de datos para entrenamiento, validaci�n y test
entrenamiento = input('Introduce ratio de entrenamiento [0-1]: ');
evaluacion = input('Introduce ratio de evaluacion [0-1]: ');
testeo = input('Introduce ratio de test [0-1]: ');
net.divideParam.trainRatio = entrenamiento;
net.divideParam.valRatio = evaluacion;
net.divideParam.testRatio = testeo;

% Entrenamiento de la red
[net, tr] = train(net, inputs, targets);

% Prueba
outputs = net(inputs);
errors = gsubtract(outputs, targets);
performance = perform(net, targets, outputs)

% Visualizaci�n de la red
view(net)

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
