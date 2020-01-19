% Entradas 
P=[0.1 0.7 0.8 0.8 1.0 0.3 0.0 -0.3 -0.5 -1.5 0.0;
    1.2 1.8 1.6 0.6 0.8 0.5 0.2 0.8 -1.5 -1.3 -1.5];

% Targets antiguos
T=[1 1 1 0 0 1 1 1 0 0 1;
   0 0 0 0 0 1 1 1 1 1 1];

% [00] -> clase 0
% [01] -> clase 1
% [10] -> clase 2
% [11] -> clase 3
    


% Red neuronal de tipo perceptron
net = perceptron;

% Par�metros de entrada y targets
net = train(net,P,T);
view(net)

% Tenemos 1 capa y 2 neuronas
disp("Nº de capas: " + net.numLayers)
disp("Nº de neuronas: " + net.layers{1}.size)



% Dibujo la gr�fica de selecci�n de tipo esta

% Esto dibuja datos
plotpv(P,T);

% Esto dibuja gr�ficas de las redes neuronales que 
% clasifican los datos
plotpc(net.iw{1,1},net.b{1});

    

