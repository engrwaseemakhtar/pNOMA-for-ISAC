% Radar model parameters
freq = 10e9; % Radar frequency in Hz
c = 299792458; % Speed of light in m/s
lambda = c/freq; % Wavelength in meters
Pt = 1; % Transmitter power in Watts
Gt = 10; % Transmitter antenna gain in dB
Gr = 10; % Receiver antenna gain in dB
RCS = 10; % Radar cross-section in square meters
R = 1e3:1e3:10e3; % Range from 1km to 10km in meters
dc = R;
snr_th = 1;
m=4;
% Calculate path loss
path_loss_sens = (lambda^2 * RCS * Pt * 10^(Gt/10) * 10^(Gr/10))./...
            ((4*pi)^3 * R.^4);
path_loss_commu =  Pt * 10^(Gt/10) * 10^(Gr/10)*(lambda./(4*pi*dc)).^2;
%[Pout1,Pout2,Pout3] = fPout(m,K,K_noma,epsilon,epsilon_noma,lambda,theta,theta_noma,omega,Rho,Rho_oma,snr_th,Psi);
% Plot path loss vs range
figure;
plot(R/1000, 10*log10(path_loss_sens), R/1000, 10*log10(path_loss_commu),'LineWidth', 2);
legend('R','C')
xlabel('Range (km)');
ylabel('Path Loss (dB)');
title(sprintf('Path Loss at %0.2f GHz with RCS = %d m^2', freq/1e9, RCS));
grid on;
