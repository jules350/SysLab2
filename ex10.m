% Exercise 10: Tune steam battery P-controllers
param

% Set parameters
delta_fkul = 2; % step disturbance in steam consumption
omega_1 = 0.005; % low frequency
B = 0; % amplitude of low frequency disturbance
omega_2 = 0.2; % high frequency
C = 0; % amplitude of high frequency disturbance
slope = 0; % ramp disturbance
z1_0 = 1; % equilibrium setting of valve z1


% PID parameters for u
K_p = 2;
K_i = 0.02;
K_d = 20;

% PID parameters for z1
K_pz = 0.3;
K_iz = 0.02;
K_dz = 0;

% steam battery controller parameters
k_out=210;
k_in=25.5;

% Simulate
Simulation_Time = 1000;
SimOut = sim('ex11_model.slx', Simulation_Time);

% Plot the controls and pressures
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

% plot steam consumption and steam battery pressure
figure(2)
subplot(221)
plot(SimOut.time, SimOut.f_kul)
xlabel("time")
ylabel("f_{kul} (kg/s)")
subplot(222)
plot(SimOut.time, SimOut.pa)
xlabel("time")
ylabel("p_a (bar)")
subplot(223)
plot(SimOut.time,SimOut.z2)
xlabel("time")
ylabel("z_2")
subplot(224)
plot(SimOut.time,SimOut.z3)
xlabel("time")
ylabel("z_3")

% sine wave disturbances
delta_fkul = 0;
C = 1;
B=1;
SimOut = sim('ex11_model.slx', Simulation_Time);

figure(3)
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

figure(4)
subplot(221)
plot(SimOut.time, SimOut.f_kul)
xlabel("time")
ylabel("f_{kul} (kg/s)")
subplot(222)
plot(SimOut.time, SimOut.pa)
xlabel("time")
ylabel("p_a (bar)")
subplot(223)
plot(SimOut.time,SimOut.z2)
xlabel("time")
ylabel("z_2")
subplot(224)
plot(SimOut.time,SimOut.z3)
xlabel("time")
ylabel("z_3")