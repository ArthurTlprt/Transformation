pkg load control

p = tf('p');
%
% sys = 1/(p^2+0.6*p+1)
%
% Tend = 20;
% NbPoints = 1000;
% t = linspace(0, Tend, NbPoints);
%
% step(sys, t);
%
% input = 1/p;
%
%
% output = input * sys;
%
% outputNumer = get(output, 'num'){1};
% outputDenom =  get(output, 'den'){1};
%
% [R, P, K, E] = residue(outputNumer, outputDenom);
%
%
% y = zeros(size(t));
% for i=1:length(R)
%   y = y + R(i) * t.^(E(i)-1)/factorial(E(i)-1) .* exp(t*P(i));
% endfor
%
% hold on;


% 1.

% g = (10*(5*p + 1))/(p^3 + 1.1*p^2 + 42.1*p + 4)
% step(g, t);
% pause(2)

% 2.

Tend = 60;
NbPoints = 1000;
t = linspace(0,Tend,NbPoints);

sys = 1/(p^2+0.6*p+1);

for omega=.1:.1:2
  x = @(t) sin(omega*t);
  T = 0:0.1:100;
  lsim(sys, x(t), t);
  [y, t, x] = lsim(sys, x(t), t);
  pause(2);
endfor

% 3.
% On a la pulsation la plus ample pour omega = 2
% On pouvait faire une recherche de maximum dans les tableaux de

% 4.

% fonction d'entrée
function x = entree(t)
  if t <= 3.25
    x = 0.7;
  else
    x = 1.0;
  end
end

% construction du signal d'entrée
T = 0:0.1:100;
u = [];
for item=T
  u(end+1) = entree(item);
end

lsim(sys, u, T);
pause(2)
