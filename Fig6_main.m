close all
clear all
clc

Rho = 1;

B = 1;
alpha = 0.33;
beta = 1;
beta1 = 0.5;
beta2 = 0.33;
zeta = 0.33;
eta = 0.5;
Phi =(alpha + eta.*beta).*B;
Phi1 =(alpha + eta.*beta1).*B;
Phi2 =(alpha + eta.*beta2).*B;
%theta = (zeta + (1-eta).*beta).*B;
theta = ((1-eta).*beta).*B;
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
Pt = 15; % Transmitter power in Watts
Gt = 10; % Transmitter antenna gain in dB
Gr = 10; % Receiver antenna gain in dB
Gtr = 10; % Transmitter antenna gain in dB
Grr = 10; % Receiver antenna gain in dB
RCS = 10; % Radar cross-section in square meters
R = 0:100:5000; % Range from 1km to 10km in meters
dc = R;
snr_th = 1;
m=1;
m1=2;
m2=4;
% Calculate path loss
Pr_sens = (lambda^2 * RCS * Pt * 10^(Gtr/10) * 10^(Grr/10))./...
            ((4*pi)^3 * R.^2);
Pr_commu =  Pt * 10^(Gt/10) * 10^(Gr/10)*(lambda./(4*pi*dc)).^2;

% rho final 
K = K./Pr_commu;
K1 = K1./Pr_commu;
K2 = K2./Pr_commu;
Pr_Sens = Phi.*Pr_sens;
Pr_sens1 = Phi1.*Pr_sens;
Pr_sens2 = Phi2.*Pr_sens;
Pfa = 1e-2;
d_th =  sqrt(2*0.1*log(1/Pfa));
% outage function
[Pout1,Pout2,Pout3] = fPoutm(m,K,m1,m2,epsilon,lambda,theta,omega,Rho);
% Detection function
[PD1,PD2,PD3] = fPD1(m,Pr_Sens,m1,m2,lambda,d_th);

yyaxis right
plot(R/1000,Pout1,R/1000,Pout2,R/1000,Pout3, MarkerSize=2, LineWidth=2)
ylabel('Comm Outage Probability (P_{Out})')


yyaxis left
plot(R/1000,PD1,R/1000,PD2,R/1000,PD3,MarkerSize=2, LineWidth=2);
xlabel('Target Range (d_s) in Km')
ylabel('Sensing Probability of Detection (P_{D})')
legend(' m = 1' ,'m = 2','m = 4','location','best');
grid on