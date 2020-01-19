clear all;
close all;

% Entrenamiento sin obstáculos
load datos_entrenamiento_sin_obs training

% Entrenamiento angular
train_angular = training(:,[1,6,7,8,12])
indices_angular = round(linspace(1,size(training,1),1500))
train_angular = train_angular(indices_angular,:)
train_angular(isinf(train_angular)) = 5.0
train_angular = double(train_angular)

% Entrenamiento lineal:
train_lineal = training(:,[2,3,4,5,13])
indices_lineal = round(linspace(1,size(training,1),1500))
train_lineal = train_lineal(indices_lineal,:)
train_lineal(isinf(train_lineal)) = 5.0
train_lineal = double(train_lineal)


