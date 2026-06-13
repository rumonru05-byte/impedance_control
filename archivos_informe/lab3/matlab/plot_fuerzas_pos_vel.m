%% Get experiment data
get_forces_data;
get_position_data;
get_velocity_data;

% Clean data
external_forces = fillmissing(external_forces, 'linear');
joint_position = fillmissing(joint_position, 'linear');
joint_velocity = fillmissing(joint_velocity, 'linear');

figure

%% 1. Plot Applied Forces data
subplot(3,1,1);
hold on
plot(external_forces(:,1)-external_forces(1,1), external_forces(:,2), 'LineWidth',1.5);
plot(external_forces(:,1)-external_forces(1,1), external_forces(:,3), 'LineWidth',1.5);
ylabel('applied force $[N]$','interpreter','latex', 'fontSize',14);
xlabel('time [s]','interpreter','latex', 'fontSize',14);
legend('$F_x$','$F_y$','interpreter','latex', 'fontSize',14);
xlim([0 external_forces(end,1)-external_forces(1,1)])
grid on
grid minor

%% 2. Plot joint position data
subplot(3,1,2);
hold on
plot(joint_position(:,1)-joint_position(1,1), joint_position(:,2), 'LineWidth',1.5);
plot(joint_position(:,1)-joint_position(1,1), joint_position(:,3), 'LineWidth',1.5);
ylabel('angular position $[rad]$','interpreter','latex', 'fontSize',14);
xlabel('time [s]','interpreter','latex', 'fontSize',14);
legend('$\theta_1$','$\theta_2$','interpreter','latex', 'fontSize',14);
xlim([0 joint_position(end,1)-joint_position(1,1)])
grid on
grid minor

%% 3. Plot joint velocity data
subplot(3,1,3);
hold on
plot(joint_velocity(:,1)-joint_velocity(1,1), joint_velocity(:,2), 'LineWidth',1.5);
plot(joint_velocity(:,1)-joint_velocity(1,1), joint_velocity(:,3), 'LineWidth',1.5);
ylabel('angular velocity $[rad/s]$','interpreter','latex', 'fontSize',14);
xlabel('time [s]','interpreter','latex', 'fontSize',14);
legend('$\dot{\theta}_1$','$\dot{\theta}_2$','interpreter','latex', 'fontSize',14);
xlim([0 joint_velocity(end,1)-joint_velocity(1,1)])
grid on
grid minor

%% Guardado SVG
% He ajustado la ruta para que se guarde en lab3 y con un nombre representativo
ruta_destino = '\\wsl.localhost\Ubuntu-22.04\home\ruben\ros\amp_rob_ws\src\uma_arm_control\archivos_informe\lab3\img\graficas_inc_g.svg';
exportgraphics(gcf, ruta_destino, 'ContentType', 'vector');