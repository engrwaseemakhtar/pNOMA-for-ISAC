close all
clear all
clc

Rho = 10;

B = 1;
%alpha = 0.33;
beta = 1;
beta1 = 0.5;
beta2 = 0.33;
zeta = 0.33;
zeta1 = beta1/2;
zeta2 = beta2/2;
alpha = zeta;
alpha1 = beta1/2;
alpha2 = beta2/2;
eta = 0.1:0.1:1;
Phi =(alpha + eta.*beta).*B;
Phi1 =(alpha1 + eta.*beta1).*B;
Phi2 =(alpha2 + eta.*beta2).*B;
%theta = (zeta + (1-eta).*beta).*B;
theta = (zeta +(1-eta).*beta).*B;
theta1 = (zeta1 +(1-eta).*beta1).*B;
theta2 = (zeta2 +(1-eta).*beta2).*B;
snr_th = 5;
omega = 1;
Psi = 1;
Mu = 1;
epsilon = alpha +beta;
epsilon1 = 1;
K = snr_th./(Rho.*Phi);
K1 = snr_th./(Rho.*Phi1);
K2 = snr_th./(Rho.*Phi2);
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
% Radar model parameters
freq = 1e6; % Radar frequency in Hz
c = 299792458; % Speed of light in m/s
lambda = c/freq; % Wavelength in meters
Pt = 20; % Transmitter power in Watts
Gt = 10; % Transmitter antenna gain in dB
Gr = 10; % Receiver antenna gain in dB
Gtr = 10; % Transmitter antenna gain in dB
Grr = 10; % Receiver antenna gain in dB
RCS = 10; % Radar cross-section in square meters
%R = 0:100:5000; % Range from 1km to 10km in meters
R = 5000; % Range from 1km to 10km in meters
dc = 2000;
snr_th = 1;
m=4;
% Calculate path loss
Pr_sens = (lambda^2 * RCS * Pt * 10^(Gtr/10) * 10^(Grr/10))./...
            ((4*pi)^3 * R.^1);
Pr_commu =  Pt * 10^(Gt/10) * 10^(Gr/10)*(lambda./(4*pi*dc)).^2;

% rho final 
K = K./Pr_commu;
K1 = K1./Pr_commu;
K2 = K2./Pr_commu;
Pr_sens = theta.*Pr_sens;
Pr_sens1 = theta1.*Pr_sens;
Pr_sens2 = theta2.*Pr_sens;
Pfa = 1e-3;
%d_th =  sqrt(2*0.1*log(1/Pfa));
d_th =  4.5;
% outage function
[Pout1,Pout2,Pout3] = fPout(m,K,K1,K2,epsilon,lambda,theta,omega,Rho);
% Detection function
[PD1,PD2,PD3] = fPD1(m,Pr_sens,Pr_sens1,Pr_sens2,lambda,d_th);

yyaxis right
%plot(R/1000,Pout1,R/1000,Pout2,R/1000,Pout3, MarkerSize=2)
plot(eta,Pout1,eta,Pout2,eta,Pout3, MarkerSize=2,linewidth=2)
ylabel('Comm Outage Probability (P_{Out})')


yyaxis left
plot(eta,1-PD1,eta,1-PD2,eta,1-PD3,MarkerSize=2, linewidth=2);
xlabel('Power coefficient (\eta) ')
ylabel('Sensing Probability of Miss Detection (P_{m})')
legend(' \beta = B/3' ,'\beta = B/2','\beta = B','location','best');
grid on