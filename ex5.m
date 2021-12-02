% Exercise 4: Add an integrator to the state feedback controller
% Run the file param.m before this one

x_0 = [fp_0 pk_0 pkp_0];  % equilibrium state

% K obtained with R=0.01
K=[2.5277    2.8612    5.6791];
k4 = 0.1; % integrator coefficient

% Simulate the system
delta_z1 = 0.08403361345; % change in valve setting
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