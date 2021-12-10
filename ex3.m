% Exercise 3: tune the PID-controller by hand
param

% Set parameters
delta_z1 = 0; % change in valve setting
delta_u = 1; % change in fuel injection

% Tune a PID-controller by hand
K_p = 2;
K_i = 0.02;
%K_i = 0; % for the P-controller
K_d = 20;
%K_d = 0; % for the P/PI-controllers

Simulation_Time = 1000;
SimOut = sim('ex3_model.slx', Simulation_Time);

figure(1)
subplot(211)
plot(SimOut.time, SimOut.u)
xlabel("time")
ylabel("u (kg/s)")

subplot(212)
plot(SimOut.time, SimOut.pkp)
xlabel("time")
ylabel("p_{kp} (bar)")

% Test the controller when the flow to the turbine changes
delta_z1 = 0.08403361345;
delta_u = 0;

SimOut = sim('ex3_model.slx', Simulation_Time);

figure(2)
subplot(211)
plot(SimOut.time, SimOut.u)
xlabel("time")
ylabel("u (kg/s)")

subplot(212)
plot(SimOut.time, SimOut.pkp)
xlabel("time")
ylabel("p_{kp} (bar)")

