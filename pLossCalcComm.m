function [pLossComm,pLossComm_dB,thNoiseC,RhoC] = pLossCalcComm(fc,c,dc,n_propag,lambda_c, gt,gr, alpha, beta, zeta,Pt)
%PLOSSCALCCOMM Summary of this function goes here
%   Detailed explanation goes here
global sigma_propag;
global n_propag;

%Thermal noise parameters
Bc = alpha+beta;  % BW portion for communication signal
thNoisePerHertz=-174; % dBm/hertz
NoiseFigure=5; %dBm

thNoiseC=10*log(Bc)+thNoisePerHertz+NoiseFigure;% thermal noise calculation. multiplied in linear formula
shadowing=sigma_propag*randn(1);
pLossComm = (4*pi/lambda_c)^2*((dc)^(n_propag));
pLossComm_dB = 10*log(pLossComm);

RhoC = Pt/(10^(thNoiseC/10));
S_rec=.001*10^(Pt/10)*((dc)^(-n_propag))*(10^(shadowing/10))*1/2*(abs(randn(1,1)+j*randn(1,1))^2); %linear  0.001 due to dBm
%Int_rec=.001*10^(int_BS_pow/10)*((d_int)^(-n_propag))*(10^(shadowing/10))*1/2*(10^(-(BPL)/10))*(abs(randn(1,1)+j*randn(1,1))^2);%+10^(thNoise/10);
end

