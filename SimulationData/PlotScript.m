
tiledlayout(2,3);
nexttile 
plot(out.SlewPos);
title('Slew Joint Position')
xlabel('Time in s')
ylabel('Position in meters')
grid on

nexttile
plot(out.Cyl1Pos);
title('Main Cylinder Position')
xlabel('Time in s')
ylabel('Position in meters')
grid on

nexttile
plot(out.Cyl2Pos);
title('Jib Cylinder Position')
xlabel('Time in s')
ylabel('Position in meters')
grid on

nexttile
plot(out.Slew_J_trap);
title('Slew Joint Velocity Profile')
xlabel('Time in s')
ylabel('Velocity in m/s')
grid on

nexttile
plot(out.Cyl1_trap);
title('Main Cylinder Velocity Profile')
xlabel('Time in s')
ylabel('Velocity in m/s')
grid on

nexttile
plot(out.Cyl2_trap);
title('Jib Cylinder Velocity Profile')
xlabel('Time in s')
ylabel('Velocity in m/s')
grid on
%%
nexttile
plot(timeseries, v_cyl1)
title('Cylinder 1 Velocity')
xlabel('Time in s')
ylabel('Velocity in m/s')
grid on

nexttile
plot(timeseries, v_cyl2)
title('Cylinder 2 Velocity')
xlabel('Time in s')
ylabel('Velocity in m/s')
grid on

nexttile
plot(timeseries, v_slew)
title('Slew Joint Velocity')
xlabel('Time in s')
ylabel('Velocity in m/s')
grid on

%%
tiledlayout(3,1);

nexttile
plot(x);
title('Tooltip Position X')
xlabel('Time in seconds')
ylabel('Position in meters')
grid on
hold on
plot(0, 1.0003, 'o', 'MarkerFaceColor','r')
hold on
plot(14.33, 2.0001, 'o', 'MarkerFaceColor','g')
hold on
plot(28.66, 2.20412, 'o', 'MarkerFaceColor','b')
hold on
plot(43, 0.6937, 'o', 'MarkerFaceColor','k')
b = legend('x position','pos: 1.0003m', 'pos: 2.0001m', 'pos: 2.20412m', 'pos: 0.6937m')
b.Location = 'northwest'

nexttile
plot(y);
title('Tooltip Position Y')
xlabel('Time in seconds')
ylabel('Position in meters')
grid on
hold on
plot(0, -2.09984, 'o', 'MarkerFaceColor','r')
hold on
plot(14.33, -0.0093, 'o', 'MarkerFaceColor','g')
hold on
plot(28.66, 2.99493, 'o', 'MarkerFaceColor','b')
hold on
plot(43, 3.0014, 'o', 'MarkerFaceColor','k')
c = legend('y position','pos: -2.09984m', 'pos: -0.0093mm', 'pos: 2.99493m', 'pos: 3.0014m')
c.Location = 'northwest';

nexttile
plot(z);
title('Tooltip Position Z')
xlabel('Time in seconds')
ylabel('Position in meters')
grid on
hold on
plot(0, -0.200, 'o', 'MarkerFaceColor','r')
hold on
plot(14.33, 0.74695, 'o','MarkerFaceColor','g')
hold on
plot(28.66, 2.49558, 'o', 'MarkerFaceColor','b')
hold on
plot(43, 1.5010, 'o', 'MarkerFaceColor','k')
d = legend('z position','pos: -0.200m', 'pos: 0.74695mm', 'pos: 2.49558m', 'pos: 1.5010m')
d.Location = 'northwest'

%%
tiledlayout(3,1);

nexttile
plot(out.Cyl1_trap);
title('Velocity Profile of Cylinder 1')
ylabel('m/s')
xlabel('Time in seconds')
grid on
ylim([-20e-3, 5e-3]);

nexttile
plot(out.Cyl2_trap)
title('Velocity Profile of Cylinder 2')
ylabel('m/s')
xlabel('Time in seconds')
grid on
ylim([-0.035, 0.02]);

nexttile
plot(out.Slew_J_trap);
title('Velocity Profile of Slew Joint')
ylabel('m/s')
xlabel('Time in seconds')
grid on
ylim([-0.001, 0.015]);

