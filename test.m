% Define system parameters
m = 1.5;           % Nakagami-m parameter
Pt = 10;           % Transmitter power
Gt = 1;            % Transmitter antenna gain
Gr = 1;            % Receiver antenna gain
lambda = 0.1;      % Wavelength
L0 = 1;            % Reference distance
alpha = 3;         % Pathloss exponent
sigma = 0.2;       % Shadowing standard deviation
Eb = 1;            % Energy per bit
N0 = 0.01;         % Noise power spectral density
Pfa = 1e-6;        % Probability of false alarm

% Define range and pathloss parameters
d = logspace(0, 5, 100); % Range in meters (logarithmic scale)
L = L0*(d./L0).^(-alpha); % Pathloss

% Calculate threshold for given Pfa
threshold = sqrt(2*N0*log(1/Pfa));

% Calculate probability of detection for each range and pathloss value
Pd = zeros(size(d));
for i = 1:length(d)
    gamma = Pt*Gt*Gr*lambda^2*L(i)/((4*pi)^2)*Eb/N0; % SNR per bit
    m_gamma = m*gamma; % Nakagami-m parameter times SNR per bit
    Pd(i) = 1 - ncx2cdf((2*threshold^2)/(m_gamma+1), 2*(m_gamma+1), 2*threshold/(sqrt(1+m)*sqrt(gamma)));
end

% Plot results
semilogx(d, Pd);
xlabel('Range (m)');
ylabel('Probability of detection');
title(['Nakagami-m fading channel (m = ' num2str(m) ', \alpha = ' num2str(alpha) ', \sigma = ' num2str(sigma) ')']);
