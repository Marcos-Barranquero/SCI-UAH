% Entradas
P=[0.1 0.7 0.8 0.8 1.0 0.3 0.0 -0.3 -0.5 -1.5;
    1.2 1.8 1.6 0.6 0.8 0.5 0.2 0.8 -1.5 -1.3];

% Targets
T=[1 1 1 0 0 1 1 1 0 0;
    0 0 0 0 0 1 1 1 1 1];

% Red neuronal de tipo perceptron
net = perceptron;

% Par�metros de entrada y targets
net = train(net,P,T);
view(net)

% Dibujo la gr�fica de selecci�n de tipo esta

% Esto dibuja datos
plotpv(P,T);

% Si lo hubiese hecho a mano tendr�a que haber puesto un holdon
% pa que lo dibujase en la misma gr�fica 

% Esto dibuja gr�a�ficas de las redes neuronales que 
% clasifican los datos
plotpc(net.iw{1,1},net.b{1});

    

