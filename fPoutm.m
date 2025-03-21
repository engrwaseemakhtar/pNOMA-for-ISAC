function [Pout1,Pout2,Pout3] = fPoutm(m,K,m1,m2,epsilon,lambda,theta,omega,Rho);
%FPOUT Summary of this function goes here
%   Detailed explanation goes here
Pout1 =1+(-1).*exp(1).^((-1).*K.*epsilon.*lambda.^(-1)).*(theta.^(-1).*Rho.^(-1)).^m.*(K.*lambda.^( ...
  -1)+m.*theta.^(-1).*Rho.^(-1).*omega.^(-1)).^((-1).*m).*(m.*omega.^(-1)).^m;
Pout2 =1+(-1).*exp(1).^((-1).*K.*0.66.*epsilon.*lambda.^(-1)).*(theta.^(-1).*Rho.^(-1)).^m1.*(K.*lambda.^( ...
  -1)+m1.*theta.^(-1).*Rho.^(-1).*omega.^(-1)).^((-1).*m1).*(m1.*omega.^(-1)).^m1;
Pout3 =1+(-1).*exp(1).^((-1).*K.*0.33.*epsilon.*lambda.^(-1)).*(theta.^(-1).*Rho.^(-1)).^m2.*(K.*lambda.^( ...
  -1)+m2.*theta.^(-1).*Rho.^(-1).*omega.^(-1)).^((-1).*m2).*(m2.*omega.^(-1)).^m2;
end

