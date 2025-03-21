function [pd1,pd2,pd3] = fPD1RCS(m,Pr_Sens,Pr_Sens1,Pr_Sens2,lambda,d_th)
%FPD Summary of this function goes here
%   Detailed explanation goes here

% pd1 = Pr_Sens.^((-1/2).*m).*expint(m.*lambda.^(-1).*Pr_Sens1.^(-1).*(Pr_Sens1.*d_th).^(1/2)) - exp(-(1+(-1).*m))/(1+(-1).*m).*gamma(m).^(-1).*(m.*lambda.^(-1).*d_th ...
%   .^(1/2)).^m;
% pd2 = Pr_Sens1.^((-1/2).*m).*expint(m.*lambda.^(-1).*Pr_Sens1.^(-1).*(Pr_Sens1.*d_th).^(1/2)) - exp(-(1+(-1).*m))/(1+(-1).*m).*gamma(m).^(-1).*(m.*lambda.^(-1).*d_th ...
%   .^(1/2)).^m;
% pd3 = Pr_Sens2.^((-1/2).*m).*expint(m.*lambda.^(-1).*Pr_Sens1.^(-1).*(Pr_Sens1.*d_th).^(1/2)) - exp(-(1+(-1).*m))/(1+(-1).*m).*gamma(m).^(-1).*(m.*lambda.^(-1).*d_th ...
%   .^(1/2)).^m;
pd1 = qfunc((d_th - sqrt(m.*Pr_Sens))./(sqrt(1+m).*sqrt(Pr_Sens)));
pd2 = qfunc((d_th - sqrt(m.*Pr_Sens1))./(sqrt(1+m).*sqrt(Pr_Sens1)));
pd3 = qfunc((d_th - sqrt(m.*Pr_Sens2))./(sqrt(1+m).*sqrt(Pr_Sens2)));
end

