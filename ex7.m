% Exercise 7: Padé approximation
param

% Compute matrices A, B and C
sp = sqrt(pk_0^2-pkp_0^2); % the square root term
z1_0 = 1; % equilibrium setting of valve z1
A=[-1/T1 0 0;
    1/Ts -k1/Ts*pk_0/sp k1/Ts*pkp_0/sp;
    0 k1*k2*pk_0/sp -k1*k2*pkp_0/sp-k2*k3*z1_0];
B = [k0/T1 0 0]';
C= [0 0 1];

% Calculate the coefficients of the transfer function
[b,a]=ss2tf(A,B,C,0)

% Compare the full model and the Padé approximation of the transfer
% function

% Parameters
delta_u=1;
delta_z1=0;
% No controller
K_p = 0;
K_i = 0;
K_d = 0;

% Run the simulations
Simulation_Time = 1000;
SimOut = sim('ex3_model.slx', Simulation_Time);
SimOut_pade = sim('ex7_model.slx', Simulation_Time);
% Plot the pressures
hold on
plot(SimOut.time, SimOut.pkp, "LineStyle", "--")
plot(SimOut_pade.time, SimOut_pade.pkp)
xlabel("time")
ylabel("p_{kp} (bar)")
legend({'Original','Padé'},"Location","southeast")
hold off
