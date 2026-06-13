%% Justificación Analítica del Controlador PD (Feedback Linearization)
clear; clc; close all;

s = tf('s');

% Definimos 3 casos de ajuste para comparar:
Kp1 = 100; Kd1 = 5; 
G1 = Kp1 / (s^2 + Kd1*s + Kp1);

Kp2 = 100; Kd2 = 20; 
G2 = Kp2 / (s^2 + Kd2*s + Kp2);

Kp3 = 100; Kd3 = 40; 
G3 = Kp3 / (s^2 + Kd3*s + Kp3);

%% Graficar la comparativa
figure('Name', 'Comparativa de Ajuste PD');
hold on;

% Simulamos la respuesta al escalón (hasta 1.5s)
[y1, t1] = step(G1, 1.5);
[y2, t2] = step(G2, 1.5);
[y3, t3] = step(G3, 1.5);

% Ploteamos usando el mismo grosor que en tus gráficas de la Práctica 2
plot(t1, y1, 'LineWidth', 1.5);
plot(t2, y2, 'LineWidth', 1.5);
plot(t3, y3, 'LineWidth', 1.5);

% Usamos el intérprete LaTeX para mantener el estilo de tu código anterior
title('Respuesta Temporal del Error Articular', 'interpreter', 'latex', 'fontSize', 14);
xlabel('time [s]', 'interpreter', 'latex', 'fontSize', 14);
ylabel('angular position $[rad]$', 'interpreter', 'latex', 'fontSize', 14);

% Configuramos la cuadrícula igual que en la Práctica 2
grid on;
grid minor;
xlim([0 1.5]);

% Leyenda con LaTeX
legend(sprintf('Subamortiguado ($K_p=%d$, $K_d=%d$)', Kp1, Kd1), ...
       sprintf('Críticamente Amortiguado ($K_p=%d$, $K_d=%d$)', Kp2, Kd2), ...
       sprintf('Sobreamortiguado ($K_p=%d$, $K_d=%d$)', Kp3, Kd3), ...
       'interpreter', 'latex', 'fontSize', 12, 'Location', 'southeast');

%% Guardado SVG transparente (Mismo formato que la Práctica 2)
% Cambia esta ruta si lo necesitas
ruta_destino = '\\wsl.localhost\Ubuntu-22.04\home\ruben\ros\amp_rob_ws\src\uma_arm_control\archivos_informe\lab3\img\ajuste_pd.svg';

% El truco para que quede como la Práctica 2 es NO poner 'BackgroundColor'
% y dejar que MATLAB lo exporte por defecto (o forzar 'none' si la web es negra)
exportgraphics(gcf, ruta_destino, 'ContentType', 'vector');