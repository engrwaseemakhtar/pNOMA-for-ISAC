function [ k1,theeta1 ] = movo( Phi,theta,lambda, Mu )%k1,theeta1,k2,theeta2,k3,theeta3
mu1 =lambda(1).^(-1) ;
% mu2 = lambda(2).^(-1);
% mu3 = lambda(3).^(-1);
v1 = lambda(1).^(-2);
% 
% v2 = lambda(2).^(-2);
% v3 = lambda(3).^(-2);
k1 = mu1^2/v1 ; 
theeta1 = v1/mu1 ; 
% k2 = mu2^2/v2 ; 
% theeta2 = v2/mu2 ; 
% k3 = mu3^2/v3 ; 
% theeta3 = v3/mu3 ; 

end


