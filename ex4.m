% Exercise 4: Construct a state feedback controller
param

% Set parameters
x_0 = [fp_0 pk_0 pkp_0];  % equilibrium state

% Cost matrices
Q = [0 0 0; 0 0 0; 0 0 1];
R = 0.01;

% Compute matrices A and B
sp = sqrt(pk_0^2-pkp_0^2); % the square root term
z1_0 = 1; % equilibrium setting of valve z1
A=[-1/T1 0 0;
    1/Ts -k1/Ts*pk_0/sp k1/Ts*pkp_0/sp;
    0 k1*k2*pk_0/sp -k1*k2*pkp_0/sp-k2*k3*z1_0];
B = [k0/T1 0 0]';

% Controllability matrix
Q_c = ctrb(A,B);
fprintf("Rank of controllability matrix: %i\n", rank(Q_c))

% Solve the Riccati equation
[K,S,e]=lqr(A,B,Q,R);

% Print K
K

% Simulate the system
delta_z1 = 0.08403361345; % change in valve setting
k_i = 0; % do not use the integral term yet
Simulation_Time = 1000;
SimOut = sim('ex5_model.slx', Simulation_Time);

% Plot the control and pressure
figure(1)
subplot(211)
plot(SimOut.time, SimOut.u)
xlabel("time")
ylabel("u (kg/s)")

subplot(212)
plot(SimOut.time, SimOut.pkp)
xlabel("time")
ylabel("p_{kp} (bar)")

% Plot the closed-loop eigenvalues
figure(2)
plot(e,"*")
