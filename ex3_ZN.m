% Exercise 3: tune the PID with the Ziegler-Nichols method. 
param

% The time step of the model is fixed to 1.
Simulation_Time = 200;
SimOut = sim('ex3_ZNmodel.slx', Simulation_Time);
delta_pkp = SimOut.pkp - pkp_0;

% Approximate the derivative of pkp
d = diff(delta_pkp);
[max_d, max_d_t] = max(d);

% Calculate the Ziegler-Nichols parameters
a =  max_d*max_d_t - delta_pkp(max_d_t); % the opposite of the y-intercept
tau = a/max_d;                           % the time-intercept
P_Kp_ZN = 1/a;
PI_Kp_ZN = 0.9/a;
PI_Ki_ZN =  0.3/(a*tau);
PID_Kp_ZN = 1.2/a;
PID_Ki_ZN = 0.6/(a*tau);
PID_Kd_ZN = 0.6*tau/a;

% Plot the step response and the tangent
hold on
plot(SimOut.time, delta_pkp, "LineStyle", "--")
plot(SimOut.time, -a+max_d*SimOut.time)
xlabel("time")
ylabel("p_{kp}-p_{kp0}")
hold off