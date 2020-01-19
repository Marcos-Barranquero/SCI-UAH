clear all;
close all;

% Entrenamiento sin obstáculos
%load datos_entrenamiento training

% Entrenamiento con obstáculo
load datos_entrenamiento_con_obs training

% Entrenamiento angular
% 2 entradas, 1 salida
% Entradas: 1 -> sonar_0; 2 -> sonar_1; 5-> sonar_4; 6 -> sonar_5;
% 7 -> sonar_6; 8 -> sonar_7;
% Salida: 12 -> vel_angular;
train_angular = training(:,[1,6,7,8,12])
indices_angular = round(linspace(1,size(training,1),1500))
train_angular = train_angular(indices_angular,:)
train_angular(isinf(train_angular)) = 5.0
train_angular = double(train_angular)

% Entrenamiento lineal:
% 4 entradas, 1 salida
% Input: sï¿½nares 1 2 3 4 -> [ 2, 3, 4, 5]
% Ouput: vel_lineal -> [13]
train_lineal = training(:,[2,3,4,5,13])
indices_lineal = round(linspace(1,size(training,1),1500))
train_lineal = train_lineal(indices_lineal,:)
train_lineal(isinf(train_lineal)) = 5.0
train_lineal = double(train_lineal)


