pkg load control

p = tf('p');

sys = 1/(p^2+0.6*p+1)

Tend = 20;
NbPoints = 1000;
t = linspace(0, Tend, NbPoints);

step(sys, t);

input = 1/p;


output = input * sys

outputNumer = get(output, 'num'){1}
outputDenom =  get(output, 'den'){1}

[R, P, K, E] = residue(outputNumer, outputDenom)


y = zeros(size(t));
for i=1:length(R)
  y = y + R(i) * t.^(E(i)-1)/factorial(E(i)-1) .* exp(t*P(i));
endfor

hold on;
