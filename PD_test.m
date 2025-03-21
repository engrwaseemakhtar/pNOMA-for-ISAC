% Define parameters
N = 100; % Number of Monte Carlo simulations
SNRdB = 0:2:20; % Range of SNR values to plot
p1 = 0.5; % Power allocation factor for user 1
p2 = 1 - p1; % Power allocation factor for user 2
sigma = 1; % Noise variance

% Pre-allocate probability of detection array
Pd = zeros(length(SNRdB), 1);

% Loop over SNR values
for i = 1:length(SNRdB)
    % Calculate SNR for each user
    SNR = 10^(SNRdB(i)/10);
    gamma1 = p1 * SNR;
    gamma2 = p2 * SNR;

    % Monte Carlo simulation to calculate probability of detection
    count = 0;
    for j = 1:N
        % Generate transmit signals
        s1 = sqrt(gamma1) * randn(1) + 1i * sqrt(gamma1) * randn(1);
        s2 = sqrt(gamma2) * randn(1) + 1i * sqrt(gamma2) * randn(1);

        % Generate noise
        n = sqrt(sigma/2) * randn(1) + 1i * sqrt(sigma/2) * randn(1);

        % Received signal
        y = s1 + s2 + n;

        % Decision metric
        d = abs(y - s1);

        % Detection
        if d > sqrt(sigma/2)
            count = count + 1;
        end
    end

    % Calculate probability of detection
    Pd(i) = count/N;
end

% Plot probability of detection
plot(SNRdB, Pd, '-o');
xlabel('SNR (dB)');
ylabel('Probability of Detection');
title('NOMA Probability of Detection');
