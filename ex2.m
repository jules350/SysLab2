% Exercise 2: Plot the step response when valve z1 is opened
param

delta_z1 = 0.084; % Step increase of 3kg/s
delta_u = 0;
% No controller
K_p = 0;
K_i = 0;
K_d = 0; 

Simulation_Time = 1000;
SimOut = sim('ex3_model.slx',Simulation_Time);

figure(1)
plot(SimOut.time, SimOut.fg)
xlabel("time")
ylabel("f_g (kg/s)")

figure(2)
plot(SimOut.time, SimOut.pkp)
xlabel("time")
ylabel("p_{kp} (bar)")