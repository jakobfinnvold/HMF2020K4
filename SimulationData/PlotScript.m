
Cylinder1_pos = get(out, "Cylinder_1_pos");
Cylinder1_vel = get(out, "Cylinder_1_vel");
Cylinder2_pos = get(out, "Cylinder_2_pos");
Cylinder2_vel = get(out, "Cylinder_2_vel");
SlewJoint_pos = get(out, "SlewJoint_pos");
SlewJoint_vel = get(out, "SlewJoint_vel");
timeseries = get(out, "tout"); 

x_cyl1 = Cylinder1_pos(1,:);
v_cyl1 = Cylinder1_vel(1,:);
x_cyl2 = Cylinder2_pos(1,:);
v_cyl2 = Cylinder2_vel(1,:);
x_slew = SlewJoint_pos(1,:);
v_slew = SlewJoint_vel(1,:); 

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


