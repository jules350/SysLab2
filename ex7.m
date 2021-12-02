% Exercise 7: Padé approximation
% Run the file param.m before this one

% Compute matrices A, B and C
sp = sqrt(pk_0^2-pkp_0^2); % the square root term
z1_0 = 1; % equilibrium setting of valve z1
A=[-1/T1 0 0;
    1/Ts -k1/Ts*pk_0/sp k1/Ts*pkp_0/sp;
    0 k1*k2*pk_0/sp -k1*k2*pkp_0/sp-k2*k3*z1_0];
B = [k0/T1 0 0]';
C= [0 0 1];

[b,a]=ss2tf(A,B,C,0)

