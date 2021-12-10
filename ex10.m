% Exercise 10: Tune steam battery P-controllers
param

% Set parameters
delta_fkul = 2; % step disturbance in steam consumption
C = 0;%1;% amplitude of high frequency disturbance
z1_0 = 1; % equilibrium setting of valve z1


% PID parameters for u
K_p = 2;
K_i = 0.02;
K_d = 20;

% PID parameters for z1
K_pz = 0.3;
K_iz = 0.02;
K_dz = 0;

k_out=210;%500;
k_in=25.5;%50;

% Simulate
Simulation_Time = 1000;
SimOut = sim('ex10_model.slx', Simulation_Time);

% Plot the counter pressure
figure(1)
subplot(221)
plot(SimOut.time, SimOut.z1)
xlabel("time")
ylabel("z_1")

subplot(223)
plot(SimOut.time, SimOut.pvp)
xlabel("time")
ylabel("p_{vp} (bar)")

subplot(222)
plot(SimOut.time, SimOut.u)
xlabel("time")
ylabel("u")

subplot(224)
plot(SimOut.time, SimOut.pkp)
xlabel("time")
ylabel("p_{kp} (bar)")

figure(2)
plot(SimOut.time, SimOut.pa)
xlabel("time")
ylabel("p_a (bar)")