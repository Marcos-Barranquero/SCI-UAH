array_tiempo_rango = zeros(1, 25)
array_tiempo_det = zeros(1, 25)

for tamano = 1:25
    matriz = randi([0, 100], tamano)

    disp("Tiempo que tarda en calcular el rango:")
    tic
    rango = rank(matriz);
    array_tiempo_rango(tamano) = toc;

    disp("Tiempo que tarda en calcular el determinante:")
    tic
    determinante = det(matriz);
    array_tiempo_det(tamano) = toc;

end

disp("Tiempo rango")
disp(array_tiempo_rango)

disp("Tiempo det")
disp(array_tiempo_det)

figure(1)
title("Los tiempos")
hold on

xlabel("Tamano de matriz")
ylabel("Tiempo")
plot(array_tiempo_det)
plot(array_tiempo_rango)
legend('tiempo determinante', 'tiempo rango')

hold off
