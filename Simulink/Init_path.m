clear; close all; clc;

%Path Coordinates
P1 = [1 -2.1 -0.2];
P2 = [2 0 0.75];
P3 = [2.2 3 2.5];
P4 = [0.7 3 1.5];
%P5 = [2 0.5 1.6]; 

%3D plot of the points
plot3(1, -2.1, -0.2, 'o'); 
hold on
plot3(2, 0, 0.75, 'o');
hold on
plot3(2.2, 3, 2.5, 'o');
hold on
plot3(0.7, 3, 1.5, 'o'); 
%hold on
%plot3(2, 0.5, 1.6); 
hold on
grid on

%Position, velocity and acceleration
%P1
x1 = P1(1, 1); %meters
x1Dot = 0.0; % No velocity
x1DotDot = 0.0; % No acceleration -> robot is stationary in rest position

y1 = P1(1, 2);
y1Dot = 0.0;
y1DotDot = 0.0;

z1 = P1(1, 3);
z1Dot = 0.0;
z1DotDot = 0.0;

%P2
x2 = P2(1,1);
x2Dot = 0.1;
x2DotDot = 0.05; 

y2 = P2(1,2);
y2Dot = 0.1;
y2DotDot = 0.05; 

z2 = P2(1,3);
z2Dot = 0.1;
z2DotDot = 0.05; 

%P3
x3 = P3(1,1);
x3Dot = -0.1;
x3DotDot = -0.05;

y3 = P3(1,2);
y3Dot =0.1;
y3DotDot = 0.05; 

z3 = P3(1,3);
z3Dot = 0.1;
z3DotDot = 0.05;

% P4
x4 = P4(1,1);
x4Dot = 0;
x4DotDot = 0;

y4 = P4(1,2);
y4Dot = 0;
y4DotDot = 0;

z4 = P4(1,3);
z4Dot = 0;
z4DotDot = 0;

%P5
%x5 = P5(1,1); 
%x5Dot = 0.0;
%x5DotDot = 0.0;

%y5 = P5(1,2);
%y5Dot = 0.0;
%y5DotDot = 0.0;

%z5 = P5(1,3);
%z5Dot = 0.0;
%z5DotDot = 0.0; 

%Arbitary Constants (Timestamps for each point, t1, t2...)
T1 = 0;
T2 = 10.75;
T3 = T2*2;
T4 = T2*3;
T5 = T2*4; 

%Timeintervals for the piecewise curve fitting
dt = 0.005;
t1 = [T1:dt:T2];
t2 = [T2:dt:T3]; 
t3 = [T3:dt:T4]; 
t4 = [T4:dt:T5]; 

%Column vectors for the position, velocity and acceleration for each point
%including arbitary constants. Arbitary constants indicate position and
%velocity at the endpoint of each curve, i.e. position and velocity at the
%next point. For the last point, acceleration must also be included to make
%the robot stop as accurately as possible. 

%P1(t1) -> P1(t2)
X1 = [x1; x1Dot; x1DotDot; x2; x2Dot];
Y1 = [y1; y1Dot; y1DotDot; y2; y2Dot]; 
Z1 = [z1; z1Dot; z1DotDot; z2; z2Dot]; 

%P2(t2) -> P2(t3)
X2 = [x2; x2Dot; x2DotDot; x3; x3Dot];
Y2 = [y2; y2Dot; y2DotDot; y3; y3Dot]; 
Z2 = [z2; z2Dot; z2DotDot; z3; z3Dot];

%P3(t3) -> P3(t4)
X3 = [x3; x3Dot; x3DotDot; x4; x4Dot];
Y3 = [y3; y3Dot; y3DotDot; y4; y4Dot]; 
Z3 = [z3; z3Dot; z3DotDot; z4; z4Dot];

%P4(t4) -> P4(t5)
%X4 = [x4; x4Dot; x4DotDot; x5; x5Dot; y5DotDot];
%Y4 = [y4; y4Dot; y4DotDot; y5; y5Dot; y5DotDot]; 
%Z4 = [z4; z4Dot; z4DotDot; z5; z5Dot; z5DotDot];

%Adding the matrices including the polynomials for each curve w/ its
%derivatives
  
A_1 = [F3(T1); F3Dot(T1); F3DotDot(T1); F3(T2); F3Dot(T2)]; 
A_2 = [F3(T2); F3Dot(T2); F3DotDot(T2); F3(T3); F3Dot(T3)];
A_3 = [F3(T3); F3Dot(T3); F3DotDot(T3); F3(T4); F3Dot(T4)]; 
%A_4 = [F4(T4); F4Dot(T4); F4DotDot(T4); F4(T5); F4Dot(T5); F4DotDot(T5)]; 
   
% Finding matrices of the unknowns for each point

AX1 = (A_1)\X1; 
AY1 = (A_1)\Y1;
AZ1 = (A_1)\Z1; 

BX2 = (A_2)\X2;
BY2 = (A_2)\Y2;
BZ2 = (A_2)\Z2;

CX3 = (A_3)\X3;
CY3 = (A_3)\Y3;
CZ3 = A_3\Z3;

%DX4 = (A_4)\X4;
%DY4 = (A_4)\Y4;
%DZ4 = (A_4)\Z4; 

% Setting up the polynomial equations for each point in XYZ
%P1 at t = t1 
X_p1 = F(t1, AX1); 
Y_p1 = F(t1, AY1);
Z_p1 = F(t1, AZ1); 

%P2 at t = t2
X_p2 = F(t2, BX2);
Y_p2 = F(t2, BY2);
Z_p2 = F(t2, BZ2); 

% P3 at t = t3
X_p3 = F(t3, CX3);
Y_p3 = F(t3, CY3);
Z_p3 = F(t3, CZ3); 

% P4 at t = t4
%X_p4 = F1(t4, DX4);
%Y_p4 = F1(t4, DY4);
%Z_p4 = F1(t4, DZ4); 

hold on
plot3(X_p1, Y_p1, Z_p1);
hold on
plot3(X_p2, Y_p2, Z_p2); 
hold on
plot3(X_p3, Y_p3, Z_p3);
%hold on
%plot3(X_p4, Y_p4, Z_p4); 
grid on
xlabel('X-Direction');
ylabel('Y-Direction');
zlabel('Z-Direction'); 
legend('P1', 'P2', 'P3', 'P4', 'P1(t)', 'P2(t)', 'P3(t)', 'P4(t)'); 


function[out] = F(t, b)
out = [ b(1) + b(2)*t + b(3)*t.^2 + b(4)*t.^3 + b(5)*t.^4];
end 

function[out] = F1(t, b)
out = [ b(1) + b(2)*t + b(3)*t.^2 + b(4)*t.^3 + b(5)*t.^4 + b(6)*t.^5];
end

function [out] = F4(t) 
out =   [1   t    t.^2    t.^3     t.^4   t.^5];
end

function [out] = F4Dot(t)
out =   [0   1    2*t    3*t.^2   4*t.^3  5*t^4];
end

function [out] = F4DotDot(t)
out = [0   0   2   6*t    12*t.^2    20*t^3];
end

function [out] = F3(t) 
out =   [1   t    t.^2    t.^3   t.^4];
end

function [out] = F3Dot(t)
out =   [0   1    2*t    3*t.^2   4*t.^3];
end

function [out] = F3DotDot(t)
out = [0   0    2    6*t   12*t.^2];
end 