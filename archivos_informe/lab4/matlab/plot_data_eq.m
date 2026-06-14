%% Cargar los datos
load_data_eq;

%% Configurar, reutilizar y maximizar la figura
fig = figure(1); % Abre siempre la ventana "Figura 1" (si ya existe, la reutiliza)
clf(fig);        % Borra lo que hubiera antes para que no se emborrone el gráfico

% Forzar a que la ventana nazca maximizada (pantalla completa)
fig.WindowState = 'maximized';

%% Subplot 1: Posición X (Actual vs Equilibrio)
subplot(2,1,1);
hold on
% Dibujar la referencia (Equilibrio) primero para que quede de fondo
plot(tiempo, eq_x, 'LineWidth', 1.5, 'Color', [0.4660 0.6740 0.1880]); % Verde (EE Posición Y)
% Dibujar la posición actual encima
plot(tiempo, pos_x, 'LineWidth', 1.5, 'Color', [0.8500 0.3250 0.0980]);      % Rojo oscuro/Naranja (Equilibrio X)

ylabel('Position X $[m]$', 'interpreter', 'latex', 'fontSize', 14);
legend('$X_{eq}$', '$X_{EE}$', 'interpreter', 'latex', 'fontSize', 14, 'Location', 'northeast');
xlim([0 tiempo(end)])
grid on
grid minor

%% Subplot 2: Posición Y (Actual vs Equilibrio)
subplot(2,1,2);
hold on
% Dibujar la referencia (Equilibrio) primero
plot(tiempo, eq_y, 'LineWidth', 1.5, 'Color', [0.9290 0.6940 0.1250]); % Amarillo/Naranja claro (Equilibrio Y)
% Dibujar la posición actual encima
plot(tiempo, pos_y, 'LineWidth', 1.5, 'Color', [0 0.4470 0.7410]); % Azul (EE Posición X)

ylabel('Position Y $[m]$', 'interpreter', 'latex', 'fontSize', 14);
xlabel('Time [s]', 'interpreter', 'latex', 'fontSize', 14);
legend('$Y_{eq}$', '$Y_{EE}$', 'interpreter', 'latex', 'fontSize', 14, 'Location', 'northeast');
xlim([0 tiempo(end)])
grid on
grid minor

%% Guardado SVG
ruta_destino = '\\wsl.localhost\ubuntu-22.04\home\ruben\ros\amp_rob_ws\src\uma_arm_control\archivos_informe\lab4\img\mat_eq.svg';
exportgraphics(gcf, ruta_destino, 'ContentType', 'vector');