clear all; close all;
% Generacion de datos de simulacion
Ts = 0.1;
x_0 = 0;
y_0 = 0;
th_0 = 0;
sim('TrajectoryControl.slx')
inputs=[E_d.signals.values';
    E_theta.signals.values'];
outputs=[V.signals.values';
    W.signals.values'];

% Definicion del modelo NARX
N=50000;
% 2 retardos en la entrada y uno en la salida
net = narxnet(0:1,1,5);


% Se preparan los arrays
nT=size(inputs,2);
inputsc=mat2cell(inputs,2,ones(nT,1));
%inputsc = num2cell(inputs,1);
outputsc=mat2cell(outputs,2,ones(nT, 1));
%outputsc = num2cell(outputs,1);
[x,xi,ai,t] = preparets(net,inputsc,{},outputsc);

% Se entrena la red NARX
net = train(net,x,t,xi,ai);
net = closeloop(net);
view(net)

% Se genera un bloque simulink con la red neuronal entrenada
gensim(net, Ts);
