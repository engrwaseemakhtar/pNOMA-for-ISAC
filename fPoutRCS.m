function [Pout1,Pout2,Pout3] = fPoutRCS(m,K,K1,K2,epsilon,lambda,theta,omega,Rho);
%FPOUT Summary of this function goes here
%   Detailed explanation goes here
Pout1 =1+(-1).*exp(1).^((-1).*K.*epsilon.*lambda.^(-1)).*(theta.^(-1).*Rho.^(-1)).^m.*(K.*lambda.^( ...
  -1)+m.*theta.^(-1).*Rho.^(-1).*omega.^(-1)).^((-1).*m).*(m.*omega.^(-1)).^m;
Pout2 =1+(-1).*exp(1).^((-1).*K1.*epsilon.*lambda.^(-1)).*(theta.^(-1).*Rho.^(-1)).^m.*(K1.*lambda.^( ...
  -1)+m.*theta.^(-1).*Rho.^(-1).*omega.^(-1)).^((-1).*m).*(m.*omega.^(-1)).^m;
Pout3 =1+(-1).*exp(1).^((-1).*K2.*epsilon.*lambda.^(-1)).*(theta.^(-1).*Rho.^(-1)).^m.*(K2.*lambda.^( ...
  -1)+m.*theta.^(-1).*Rho.^(-1).*omega.^(-1)).^((-1).*m).*(m.*omega.^(-1)).^m;
end

