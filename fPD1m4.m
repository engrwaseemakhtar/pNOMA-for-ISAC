function [pd1,pd2,pd3,pd4] = fPD1m4(m,m1,m2,m3,Pr_Sens,lambda,d_th);
%FPD Summary of this function goes here
%   Detailed explanation goes here

% pd1 = Pr_Sens.^((-1/2).*m).*expint(m.*lambda.^(-1).*Pr_Sens1.^(-1).*(Pr_Sens1.*d_th).^(1/2)) - exp(-(1+(-1).*m))/(1+(-1).*m).*gamma(m).^(-1).*(m.*lambda.^(-1).*d_th ...
%   .^(1/2)).^m;
% pd2 = Pr_Sens1.^((-1/2).*m).*expint(m.*lambda.^(-1).*Pr_Sens1.^(-1).*(Pr_Sens1.*d_th).^(1/2)) - exp(-(1+(-1).*m))/(1+(-1).*m).*gamma(m).^(-1).*(m.*lambda.^(-1).*d_th ...
%   .^(1/2)).^m;
% pd3 = Pr_Sens2.^((-1/2).*m).*expint(m.*lambda.^(-1).*Pr_Sens1.^(-1).*(Pr_Sens1.*d_th).^(1/2)) - exp(-(1+(-1).*m))/(1+(-1).*m).*gamma(m).^(-1).*(m.*lambda.^(-1).*d_th ...
%   .^(1/2)).^m;
pd1 = qfunc((d_th - sqrt(m.*Pr_Sens))./(sqrt(1+m).*sqrt(Pr_Sens)));
pd2 = qfunc((d_th - sqrt(m1.*Pr_Sens))./(sqrt(1+m1).*sqrt(Pr_Sens)));
pd3 = qfunc((d_th - sqrt(m2.*Pr_Sens))./(sqrt(1+m2).*sqrt(Pr_Sens)));
pd4 = qfunc((d_th - sqrt(m3.*Pr_Sens))./(sqrt(1+m3).*sqrt(Pr_Sens)));
end

