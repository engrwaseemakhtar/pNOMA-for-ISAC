function [pLossSens,pLossSens_dB,thNoiseS,RhoS,PL_factor] = pLossCalcSens(ds,s_propag,sigma_rcs,tau_pulse,dutycycle,lambda_c,alpha, beta, zeta,Pt)
%PLOSSCALCSENS Summary of this function goes here
%   Detailed explanation goes here
%Thermal noise parameters
global sigma_propag;
global n_propag;
global s_propag;

Bs = beta+zeta;  % BW portion for communication signal
thNoisePerHertz=-174; % dBm/hertz
NoiseFigure=5; %dBm

thNoiseS=10*log(Bs)+thNoisePerHertz+NoiseFigure;% thermal noise calculation. multiplied in linear formula
shadowing=sigma_propag*randn(1);
pLossSens = (4*pi/lambda_c)^2*((ds)^(s_propag))/(sigma_rcs);
pLossSens_dB = 10*log(pLossSens);
PL_factor = 4*pi*sigma_rcs*(lambda_c/4*pi)^2*((ds)^(-s_propag));
RhoS = Pt/(10^(thNoiseS/10));
S_rec=.001*10^(Pt/10)*((ds)^(-n_propag))*(10^(shadowing/10))*1/2*(abs(randn(1,1)+j*randn(1,1))^2); %linear  0.001 due to dBm
%Int_rec=.001*10^(int_BS_pow/10)*((d_int)^(-n_propag))*(10^(shadowing/10))*1/2*(10^(-(BPL)/10))*(abs(randn(1,1)+j*randn(1,1))^2);%+10^(thNoise/10);

end

