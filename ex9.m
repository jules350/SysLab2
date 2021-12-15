% Exercise 9: Tune controllers for the valve z1
param

% Set parameters
delta_fkul = 2; % disturbance in steam consumption
z1_0 = 1; % equilibrium setting of valve z1
% PID parameters for u
K_p = 2;
K_i = 0.02;
K_d = 20;

% PID parameters for z1
K_pz = 0.3;
K_iz = 0.02;
K_dz = 0;
%K_dz = 3; % for PID-controller

% Simulate
Simulation_Time = 1000;
SimOut = sim('ex9_model.slx', Simulation_Time);

% Plot the counter pressure
figure(1)
subplot(211)
plot(SimOut.time, SimOut.z1)
xlabel("time")
ylabel("z_1")

subplot(212)
plot(SimOut.time, SimOut.pvp)
xlabel("time")
ylabel("p_{vp} (bar)")