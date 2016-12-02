% 2

% % A)

theta = 0.2;
T = 1;
N = 8; % les termes de la série de Fourier iront de -N à N
tMin = -3*T; tMax = 5*T;

nSteps = 2^14+1; % nb d'échantillons
t = linspace(tMin,tMax,nSteps); % 16385 échantillons répartis linéairement
x = sq(theta,T,t);

figure(1)
hold on, grid on
axis([tMin tMax -1 2]) % fixe les limites du graphique
plot(t,x)
pause(2);


% B)

f = -N/T:1/T:N/T;
spectrum = theta * sinc(f*T*theta); % avec la convention ``étrangère'' de sinc
figure(2)
hold on, grid on
stem(f,spectrum,"r") % stem est comme plot, mais utilise des raies
pause(2);

fFast = -N/T:1/(4*T):N/T;
envelope = theta * sinc(fFast*T*theta); % attention, convention
plot(fFast,envelope,"k")
pause(2);

% C)

xFourier = zeros(size(t)); % tableau de 0s ayant la même taille que t
for n = -N:N
cn = spectrum(N+1-n);
% la liste spectrum contient les coef de Fourier
xFourier += cn * exp(2*j*pi*n/T*t);
endfor
figure(1)
plot(t,xFourier,"r")
pause(2);

% III
% A)
% 1.
% L'allure ne change pas, seul l'interval entre chaque harmonique change.

T = 1;

f = -N/T:1/T:N/T;
figure;
spectrum = theta * sinc(f*T*theta); % avec la convention ``étrangère'' de sinc
subplot(2, 1, 1)
hold on, grid on
stem(f,spectrum,"r") % stem est comme plot, mais utilise des raies
fFast = -N/T:1/(4*T):N/T;
envelope = theta * sinc(fFast*T*theta); % attention, convention
plot(fFast,envelope,"k")


T = 5;

f = -N/T:1/T:N/T;
% figure;
spectrum = theta * sinc(f*T*theta); % avec la convention ``étrangère'' de sinc
subplot(2, 1, 2)
hold on, grid on
stem(f,spectrum,"r") % stem est comme plot, mais utilise des raies
fFast = -N/T:1/(4*T):N/T;
envelope = theta * sinc(fFast*T*theta); % attention, convention
plot(fFast,envelope,"k")


% 2.
% L'amplitude change mais pas la fréquence.
% Pour Theta = 1/2 On a des amplitudes nulles pour tous les harmoniques paires à causes des ondulations de l'amplitude
% Pareil pour theta = 1/p. Les |C np| = 0

T = 1;
theta = 0.2;
f = -N/T:1/T:N/T;
figure;
spectrum = theta * sinc(f*T*theta); % avec la convention ``étrangère'' de sinc
subplot(2, 1, 1)
hold on, grid on
stem(f,spectrum,"r") % stem est comme plot, mais utilise des raies
fFast = -N/T:1/(4*T):N/T;
envelope = theta * sinc(fFast*T*theta); % attention, convention
plot(fFast,envelope,"k")


theta = 1/2;
f = -N/T:1/T:N/T;
spectrum = theta * sinc(f*T*theta); % avec la convention ``étrangère'' de sinc
subplot(2, 1, 2)
hold on, grid on
stem(f,spectrum,"r") % stem est comme plot, mais utilise des raies
fFast = -N/T:1/(4*T):N/T;
envelope = theta * sinc(fFast*T*theta); % attention, convention
plot(fFast,envelope,"k")

% 3.

% 4.
% Utilisez les portes plutot que sinc en fait...
figure;
subplot(2, 1, 1)
[fFast, envelope] = sinc_freq(8, theta, T);
plot(fFast, envelope);
subplot(2, 1, 2)
[fFast, envelope] = sinc_freq(22, theta, T);
plot(fFast, envelope);

pause
