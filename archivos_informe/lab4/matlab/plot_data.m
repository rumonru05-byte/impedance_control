%% Cargar los datos
load_data;

%% Configurar, reutilizar y maximizar la figura
fig = figure(1); % Abre siempre la ventana "Figura 1" (si ya existe, la reutiliza)
clf(fig);        % Borra lo que hubiera antes para que no se emborrone el gráfico

% Forzar a que la ventana nazca maximizada (pantalla completa)
fig.WindowState = 'maximized';

%% Subplot 1: Fuerzas Externas X e Y
subplot(3,1,1);
hold on
plot(tiempo, fuerza_x, 'LineWidth', 1.5, 'Color', [0.8500 0.3250 0.0980]); % Naranja/Rojo
plot(tiempo, fuerza_y, 'LineWidth', 1.5, 'Color', [0 0.4470 0.7410]);      % Azul
ylabel('External Force $[N]$', 'interpreter', 'latex', 'fontSize', 14);
legend('$F_x$', '$F_y$', 'interpreter', 'latex', 'fontSize', 14);
xlim([0 tiempo(end)])
grid on
grid minor

%% Subplot 2: Posición EE (X)
subplot(3,1,2);
hold on
plot(tiempo, pos_x, 'LineWidth', 1.5, 'Color', [0.8500 0.3250 0.0980]);    % Verde
ylabel('EE Position X $[m]$', 'interpreter', 'latex', 'fontSize', 14);
legend('$X$', 'interpreter', 'latex', 'fontSize', 14);
xlim([0 tiempo(end)])
grid on
grid minor

%% Subplot 3: Posición EE (Y)
subplot(3,1,3);
hold on
plot(tiempo, pos_y, 'LineWidth', 1.5, 'Color', [0 0.4470 0.7410]);    % Morado
ylabel('EE Position Y $[m]$', 'interpreter', 'latex', 'fontSize', 14);
xlabel('time [s]', 'interpreter', 'latex', 'fontSize', 14);
legend('$Y$', 'interpreter', 'latex', 'fontSize', 14);
xlim([0 tiempo(end)])
grid on
grid minor

%% Guardado SVG
ruta_destino = '\\wsl.localhost\ubuntu-22.04\home\ruben\ros\amp_rob_ws\src\uma_arm_control\archivos_informe\lab4\img\mat_x.svg';
exportgraphics(gcf, ruta_destino, 'ContentType', 'vector');