clear all 
clc
close all


% Define system parameters
m = 2;             % Nakagami-m parameter
Eb = 1;            % Energy per bit
N0 = 0.1;          % Noise power spectral density
Pfa = 1e-3;        % Probability of false alarm
SNR_dB = 300;   % Signal-to-noise ratio (SNR) range in dB
SNR = 10.^(SNR_dB/10); % Convert SNR to linear scale
%%
% Radar model parameters
freq = 10e9; % Radar frequency in Hz
c = 299792458; % Speed of light in m/s
lambda = c/freq; % Wavelength in meters
Pt = 300; % Transmitter power in Watts
Gt = 10; % Transmitter antenna gain in dB
Gr = 10; % Receiver antenna gain in dB
RCS = .1; % Radar cross-section in square meters
R = logspace(0, 50, 1000); % Range from 1km to 10km in meters
% Calculate path loss
path_loss_sens = (lambda^2 .* RCS .* Pt .* 10^(Gt/10) .* 10^(Gr/10))./...
            ((4.*pi)^3 .*R.^4);
%path_loss_commu =  Pt * 10^(Gt/10) * 10^(Gr/10)*(lambda./(4*pi*dc)).^2;

%SNR = SNR.*path_loss_sens;

% Calculate threshold for given Pfa
threshold = sqrt(2*N0*log(1/Pfa));

% Calculate probability of detection for each SNR value
path_loss_sens=zeros(size(R));
Pd = zeros(size(R));
for i = 1:length(R)
    path_loss_sens(i) = (lambda^2 .* RCS .* Pt .* 10^(Gt/10) .* 10^(Gr/10))./...
            ((4.*pi)^3 .*R(i).^4);
    gamma = SNR*path_loss_sens*Eb/N0; % SNR per bit
    Pd(i) = qfunc((threshold - sqrt(m*gamma))/(sqrt(1+m)*sqrt(gamma)));
end

% Plot results
plot(R, path_loss_sens);
xlabel('R');
ylabel('Probability of detection');
title(['Nakagami-m fading channel (m = ' num2str(m) ')']);
