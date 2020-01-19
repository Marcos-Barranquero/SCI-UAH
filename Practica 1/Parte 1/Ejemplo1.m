% Entradas
P=[0.1 0.7 0.8 0.8 1.0 0.3 0.0 -0.3 -0.5 -1.5;
    1.2 1.8 1.6 0.6 0.8 0.5 0.2 0.8 -1.5 -1.3];

% Targets
T=[1 1 1 0 0 1 1 1 0 0;
    0 0 0 0 0 1 1 1 1 1];

% Red neuronal de tipo perceptron
net = perceptron;

% Parï¿½metros de entrada y targets
net = train(net,P,T);
view(net)

% Dibujo la grï¿½fica de selecciï¿½n de tipo esta

% Esto dibuja datos
plotpv(P,T);

% Si lo hubiese hecho a mano tendrï¿½a que haber puesto un holdon
% pa que lo dibujase en la misma grï¿½fica 

% Esto dibuja grïa½ficas de las redes neuronales que 
% clasifican los datos
plotpc(net.iw{1,1},net.b{1});

    

