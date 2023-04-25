
Cylinder1_pos = get(out, "Cylinder_1_pos");
%Cylinder1_vel = get(out, "Cylinder_1_vel");
Cylinder2_pos = get(out, "Cylinder_2_pos");
%Cylinder2_vel = get(out, "Cylinder_2_vel");
SlewJoint_pos = get(out, "SlewJoint_pos");
%SlewJoint_vel = get(out, "SlewJoint_vel");
timeseries = get(out, "tout"); 

x_cyl1 = Cylinder1_pos(1,:);
%v_cyl1 = Cylinder1_vel(1,:);
x_cyl2 = Cylinder2_pos(1,:);
%v_cyl2 = Cylinder2_vel(1,:);
x_slew = SlewJoint_pos(1,:);
%v_slew = SlewJoint_vel(1,:); 

t = tiledlayout(2,3);
nexttile
plot(timeseries, x_cyl1)
title('Cylinder 1 Position')
xlabel('Time in s')
ylabel('Position in m')
grid on

nexttile
plot(timeseries, x_cyl2)
title('Cylinder 2 Position')
xlabel('Time in s')
ylabel('Position in m')
grid on

nexttile
plot(timeseries, x_slew)
title('Slew Joint Position')
xlabel('Time in s')
ylabel('Position in m')
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
plot(out.x_pos_tooltip);
title('Tooltip Position X')
xlabel('Time in seconds')
ylabel('Position in meters')
grid on
hold on
plot(0, 1.004, 'o', 'MarkerFaceColor','r')
hold on
plot(14.33, 1.997, 'o', 'MarkerFaceColor','g')
hold on
plot(28.66, 2.216, 'o', 'MarkerFaceColor','b')
hold on
plot(43, 0.699768, 'o', 'MarkerFaceColor','k')
b = legend('x position','pos: 1.004m', 'pos: 1.997m', 'pos: 2.216m', 'pos: 0.699768m')
b.Location = 'northwest'

nexttile
plot(out.y_pos_tooltip);
title('Tooltip Position Y')
xlabel('Time in seconds')
ylabel('Position in meters')
grid on
hold on
plot(0, -2.094, 'o', 'MarkerFaceColor','r')
hold on
plot(14.33, -0.002930, 'o', 'MarkerFaceColor','g')
hold on
plot(28.66, 2.986, 'o', 'MarkerFaceColor','b')
hold on
plot(43, 3.000, 'o', 'MarkerFaceColor','k')
c = legend('y position','pos: -2.094m', 'pos: -2.930mm', 'pos: 2.986m', 'pos: 3.000m')
c.Location = 'northwest';

nexttile
plot(out.z_pos_tooltip);
title('Tooltip Position Z')
xlabel('Time in seconds')
ylabel('Position in meters')
grid on
hold on
plot(0, -0.200305, 'o', 'MarkerFaceColor','r')
hold on
plot(14.33, 0.749667, 'o','MarkerFaceColor','g')
hold on
plot(28.66, 2.490, 'o', 'MarkerFaceColor','b')
hold on
plot(43, 1.499, 'o', 'MarkerFaceColor','k')
d = legend('z position','pos: -0.200305m', 'pos: 0.749667mm', 'pos: 2.490m', 'pos: 1.499m')
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