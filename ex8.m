% Exercise 8: Plot the response to increased consumption
param

% Set parameters
delta_fkul = 2; % disturbance in steam consumption
z1_0 = 1; % equilibrium setting of valve z1
% PID parameters set by hand in Exercise 3
K_p = 2;
K_i = 0.02;
K_d = 20;
% No controller for z1
K_pz = 0;
K_iz = 0;
K_dz = 0;

% Simulate
Simulation_Time = 1000;
SimOut = sim('ex9_model.slx', Simulation_Time);

% Plot the counter pressure
plot(SimOut.time, SimOut.pvp)
xlabel("time")
ylabel("p_{vp} (bar)")