function [ k1,theeta1,k2,theeta2,k3,theeta3] = mpvp( Phi,theta,lambda, Mu  )
EulerGamma = 0.5772;

m1 = (-1).*theta.^(-1).*lambda.^(-1).*Mu(1).^2.*Phi+EulerGamma.*theta.^(-1).*lambda.^(-1).*Mu(1).^2.*Phi+ ...
  theta.^(-1).*lambda.^(-1).*Mu(1).^2.*Phi.*log(Mu(1));
m2 = (-1).*theta.^(-1).*lambda.^(-1).*Mu(2).^2.*Phi+EulerGamma.*theta.^(-1).*lambda.^(-1).*Mu(2).^2.*Phi+ ...
  theta.^(-1).*lambda.^(-1).*Mu(2).^2.*Phi.*log(Mu(2));
m3 = (-1).*theta.^(-1).*lambda.^(-1).*Mu(3).^2.*Phi+EulerGamma.*theta.^(-1).*lambda.^(-1).*Mu(3).^2.*Phi+ ...
  theta.^(-1).*lambda.^(-1).*Mu(3).^2.*Phi.*log(Mu(3));


v1 =(-1/12).*theta.^(-2).*lambda.^(-2).*Mu(1).^2.*Phi.^2+(-3/2).*theta.^(-2).*lambda.^(-2).*Mu(1).^3.* ...
  Phi.^2+EulerGamma.*theta.^(-2).*lambda.^(-2).*Mu(1).^3.*Phi.^2+(-29/18).*theta.^(-2).*lambda.^(-2) ...
  .*Mu(1).^4.*Phi.^2+(7/3).*EulerGamma.*theta.^(-2).*lambda.^(-2).*Mu(1).^4.*Phi.^2+(-1).* ...
  EulerGamma.^2.*theta.^(-2).*lambda.^(-2).*Mu(1).^4.*Phi.^2+theta.^(-2).*lambda.^(-2).*Mu(1).^3.* ...
  Phi.^2.*log(Mu(1))+(7/3).*theta.^(-2).*lambda.^(-2).*Mu(1).^4.*Phi.^2.*log(Mu(1))+(-2).* ...
  EulerGamma.*theta.^(-2).*lambda.^(-2).*Mu(1).^4.*Phi.^2.*log(Mu(1))+(-1).*theta.^(-2).*lambda.^(-2) ...
  .*Mu(1).^4.*Phi.^2.*log(Mu(1)).^2; 

v2 = (-1/12).*theta.^(-2).*lambda.^(-2).*Mu(2).^2.*Phi.^2+(-3/2).*theta.^(-2).*lambda.^(-2).*Mu(2).^3.* ...
  Phi.^2+EulerGamma.*theta.^(-2).*lambda.^(-2).*Mu(2).^3.*Phi.^2+(-29/18).*theta.^(-2).*lambda.^(-2) ...
  .*Mu(2).^4.*Phi.^2+(7/3).*EulerGamma.*theta.^(-2).*lambda.^(-2).*Mu(2).^4.*Phi.^2+(-1).* ...
  EulerGamma.^2.*theta.^(-2).*lambda.^(-2).*Mu(2).^4.*Phi.^2+theta.^(-2).*lambda.^(-2).*Mu(2).^3.* ...
  Phi.^2.*log(Mu(2))+(7/3).*theta.^(-2).*lambda.^(-2).*Mu(2).^4.*Phi.^2.*log(Mu(2))+(-2).* ...
  EulerGamma.*theta.^(-2).*lambda.^(-2).*Mu(2).^4.*Phi.^2.*log(Mu(2))+(-1).*theta.^(-2).*lambda.^(-2) ...
  .*Mu(2).^4.*Phi.^2.*log(Mu(2)).^2;
v3 = (-1/12).*theta.^(-2).*lambda.^(-2).*Mu(3).^2.*Phi.^2+(-3/2).*theta.^(-2).*lambda.^(-2).*Mu(3).^3.* ...
  Phi.^2+EulerGamma.*theta.^(-2).*lambda.^(-2).*Mu(3).^3.*Phi.^2+(-29/18).*theta.^(-2).*lambda.^(-2) ...
  .*Mu(3).^4.*Phi.^2+(7/3).*EulerGamma.*theta.^(-2).*lambda.^(-2).*Mu(3).^4.*Phi.^2+(-1).* ...
  EulerGamma.^2.*theta.^(-2).*lambda.^(-2).*Mu(3).^4.*Phi.^2+theta.^(-2).*lambda.^(-2).*Mu(3).^3.* ...
  Phi.^2.*log(Mu(3))+(7/3).*theta.^(-2).*lambda.^(-2).*Mu(3).^4.*Phi.^2.*log(Mu(3))+(-2).* ...
  EulerGamma.*theta.^(-2).*lambda.^(-2).*Mu(3).^4.*Phi.^2.*log(Mu(3))+(-1).*theta.^(-2).*lambda.^(-2) ...
  .*Mu(3).^4.*Phi.^2.*log(Mu(3)).^2;
k1 = m1^2/v1 ; 
theeta1 = v1/m1 ; 
k2 = m2^2/v2 ; 
theeta2 = v2/m2 ; 
k3 = m3^2/v3 ; 
theeta3 = v3/m3 ; 

end


