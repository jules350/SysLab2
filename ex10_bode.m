% Exercise 10: Draw Bode plots of the frequency responses

% PID parameters for u
K_p = 2;
K_i = 0.02;
K_d = 20;

% PID parameters for z1
K_pz = 0.3;
K_iz = 0.02;
K_dz = 0;

pidsys1 = pid(K_p,K_i,K_d,0.01);    % controller for u
pidsys2 = pid(K_pz,K_iz,K_dz,0.01); % controller for z1
w=0.001:0.001:0.2; % frequencies in rad/s

figure(1)
bode(pidsys1,w)
figure(2)
bode(pidsys2,w)