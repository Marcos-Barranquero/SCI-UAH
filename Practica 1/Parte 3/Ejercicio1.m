clear all; close all;
% Generacion de datos de simulacion
Ts = 0.1;
sim('test_bench.slx')
inputs=x.signals.values';
outputs=y.signals.values';

% Definicion del modelo NARX
N=5;
net = narxnet(1:2,1:2,[N]);

% Se preparan los arrays
nT=size(inputs,2);
inputsc=mat2cell(inputs,1,ones(nT,1));
outputsc=mat2cell(outputs,1,ones(nT,1));

[x,xi,ai,t] = preparets(net,inputsc,{},outputsc);

% Se entrena la red NARX
net = train(net,x,t,xi,ai);
net = closeloop(net);
view(net)

% Se genera un bloque simulink con la red neuronal entrenada
gensim(net, Ts);
