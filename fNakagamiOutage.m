function [f5a,f5b,f5c] = fNakagamiOutage(m,K,K_noma,epsilon,epsilon_noma,lambda,theta,theta_noma,omega,Rho,Rho_oma,snr_th,Psi);
%RAYLEIGHOUTAGE Summary of this function goes here
%   Detailed explanation goes here
%======================semi partial NOMA======================%
%f5a =1+(-1).*exp(1).^((-1).*K.*epsilon_noma.*lambda.^(-1)).*(omega.^(-1)).^Psi.*(K.*lambda.^(-1)+theta.^(-1) ...
%   .*omega.^(-1).*Rho.^(-1)).^((-1).*Psi).*(theta.^(-1).*Rho.^(-1)).^Psi;

f5a =1+(-1).*exp(1).^((-1).*K.*epsilon.*lambda.^(-1)).*(theta.^(-1).*Rho.^(-1)).^m.*(K.*lambda.^( ...
  -1)+m.*theta.^(-1).*Rho.^(-1).*omega.^(-1)).^((-1).*m).*(m.*omega.^(-1)).^m;
%======================pure NOMA======================%
% f5b =1+(-1).*exp(1).^((-1).*K_noma.*epsilon.*lambda.^(-1)).*(omega.^(-1)).^Psi.*(K_noma.*lambda.^(-1)+theta_noma.^(-1) ...
%   .*omega.^(-1).*Rho.^(-1)).^((-1).*Psi).*(theta_noma.^(-1).*Rho.^(-1)).^Psi;
f5b =1+(-1).*exp(1).^((-1).*K_noma.*epsilon_noma.*lambda.^(-1)).*(theta_noma.^(-1).*Rho.^(-1)).^m.*(K_noma.*lambda.^( ...
  -1)+m.*theta_noma.^(-1).*Rho.^(-1).*omega.^(-1)).^((-1).*m).*(m.*omega.^(-1)).^m;
%======================OMA======================%
f5c =1+(-1).*exp(1).^((-1).*lambda.*Rho_oma.^(-1).*snr_th);

end

