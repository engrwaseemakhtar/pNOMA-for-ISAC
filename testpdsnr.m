% Define system parameters
m = 2;             % Nakagami-m parameter
Eb = 1;            % Energy per bit
N0 = 0.1;          % Noise power spectral density
Pfa = 1e-3;        % Probability of false alarm
SNR_dB = 0:2:30;   % Signal-to-noise ratio (SNR) range in dB
SNR = 10.^(SNR_dB/10); % Convert SNR to linear scale

% Calculate threshold for given Pfa
threshold = sqrt(2*N0*log(1/Pfa));

% Calculate probability of detection for each SNR value
Pd = zeros(size(SNR));
for i = 1:length(SNR)
    gamma = SNR(i)*Eb/N0; % SNR per bit
    Pd(i) = qfunc((threshold - sqrt(m*gamma))/(sqrt(1+m)*sqrt(gamma)));
end

% Plot results
plot(SNR_dB, Pd);
xlabel('SNR (dB)');
ylabel('Probability of detection');
title(['Nakagami-m fading channel (m = ' num2str(m) ')']);
