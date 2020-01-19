% Coordenadas (x, y) que van desde -5 a 5 haciendo steps de 0.25
x = -5:0.25:5;
y = -5:0.25:5;

% Cargo grid 
[X, Y] = meshgrid(x);

% Función
Z = Y.*sin(pi.*(X/10))+5.*cos((X.^2+y.^2)/8)+cos(X + Y).*cos(3.*X-Y);


% Dibujo la gráfica
figure(1);

% Parte superior y centrada, gráfica de la superficie
subplot(2,1,1);

% Título
title('Grafica de la superfice');
surf(X,Y,Z);

% Etiquetas
ylabel('Eje y');
xlabel('Eje x');

% Parte inferior, superficie de malla y gráfica de contorno
subplot(2,1,2);

% Título
title("Graficas forma de malla y contorno")
mesh(X,Y,Z);
hold on;
contourf(X,Y,Z);

% Etiquetas
ylabel('Eje y');
xlabel('Eje x');
colorbar
hold off;