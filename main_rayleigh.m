

clc
clear all
close all;
%%%%%%%%%%%%%%%%%%%%%%
% Rho = 0:0.1:10;
Rho = 10;

B = 1;
alpha = 0.33;
beta = 0.33;
zeta = 0.33;
eta = 0.5;
Phi =(alpha + eta.*beta).*B;
%theta = (zeta + (1-eta).*beta).*B;
theta = ((1-eta).*beta).*B;
snr_th = 0:0.1:10;
omega = 1;
Psi = 1;
Mu = 1;
epsilon = alpha +beta;
epsilon1 = 1;
K = snr_th./(Rho.*Phi);
lambda = 1;

Mu = 1;
%==== for pure NOMA
Phi_noma =(eta).*B;
theta_noma = (1-eta).*B;
epsilon_noma = B;
K_noma = snr_th./(Rho.*Phi_noma);
%==== for OMA
Phi_oma =(alpha + (beta/2)).*B;
theta_oma = (1-eta).*B;
epsilon_oma = 1;
K_oma = snr_th./(Rho.*Phi_noma);
Rho_oma = Rho/6;
[f4a,f4b,f4c] = fRayleighOutage(K,K_noma,epsilon,epsilon_noma,lambda,theta,theta_noma,Mu,Rho,Rho_oma,snr_th);
m=1;
[f5a,f5b,f5c] = fNakagamiOutage(m,K,K_noma,epsilon,epsilon_noma,lambda,theta,theta_noma,omega,Rho,Rho_oma,snr_th,Psi);
m=2;
[f7a,f7b,f7c] = fNakagamiOutage(m,K,K_noma,epsilon,epsilon_noma,lambda,theta,theta_noma,omega,Rho,Rho_oma,snr_th,Psi);
m=4;
[f8a,f8b,f8c] = fNakagamiOutage(m,K,K_noma,epsilon,epsilon_noma,lambda,theta,theta_noma,omega,Rho,Rho_oma,snr_th,Psi);
%plot(snr_th,f5a,'-',snr_th,f7a,'--',snr_th,f8a,'-.')
%% =================================================================================================
tiledlayout(3,1)
xlabel('SINR Threshold(\gamma_{th})')
ylabel('Outage Probability (P_{out})')
%% Top plot
nexttile
plot(snr_th,f5a,'-',snr_th,f5b,'--',snr_th,f5c,'-.')
xlabel('\gamma_{th}')
ylabel('Comm. P_{out}')
title('m = 1');
legend(' partial NOMA' ,'Pure NOMA','OMA','location','southeast');
grid on
%% Bottom plot
nexttile
plot(snr_th,f8a,'-',snr_th,f8b,'--',snr_th,f8c,'-.')
xlabel('\gamma_{th}')
ylabel('Comm. P_{out}')
title('m = 4');
legend(' partial NOMA' ,'Pure NOMA','OMA','location','southeast');
grid on
%% Bottom plot
nexttile
plot(snr_th,f5a,'-',snr_th,f8a,'-')
xlabel('\gamma_{th}')
ylabel('Comm. P_{out}')
title('partial NOMA');
legend(' m = 1' ,'m = 4','location','southeast');
grid on
%xlim([0 5])
%% Bottom plot
nexttile
plot(snr_th,f5b,'-',snr_th,f7b,'-')
xlabel('\gamma_{th}')
ylabel('Comm. P_{out}')
title('pure NOMA');
legend(' m = 1' ,'m = 4','location','southeast');
grid on