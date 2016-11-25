% Intro
mySinc(3)


% C)
% a)

Fig = figure(1)
set(Fig, 'Position', [100 0 800 800])

function x = H(t)
  x = t >= 0;
end

function x = f(t)
  x = 2* H(t) .*exp(-t);
end

function x = g(t)
  x = 3 * exp(-4*(t - 1).^2) + 2 * exp(-2*(t - 2.5).^2);
end


[y t] = ct_conv(@f, @g, [0, 10], 0.01);

subplot(3, 2, 1)
plot(t, y, t, g(t), t, f(t))

% On voit que la convolution est renversée

% b)

function x = P(t)
  x = t >= -0.5 & t <= 0.5;
end

function x = Q(t)
  x = t >= -1 & t <= 1;
end


[y t] = ct_conv(@P, @Q, [-5, 5], 0.01);
subplot(3, 2, 2)
plot(t, P(t), t, Q(t), t, y)

% On voit qu'on peut retrouver l'air en additionnant un rectangle et 2 demis rectangles

% D)
% a)

function x = Pe(t, e)
  x = (1./e).*P(t./e);
end

function x = h(t)
  x = exp(-t.^2) .* sin(t./10);
end

subplot(3, 2, 3)
[y0 t] = ct_conv_e(@Pe, @h, [-3*pi, 3*pi], 0.01, 0.01);
[y1 t] = ct_conv_e(@Pe, @h, [-3*pi, 3*pi], 0.01, 0.05);
[y2 t] = ct_conv_e(@Pe, @h, [-3*pi, 3*pi], 0.01, 0.1);
[y3 t] = ct_conv_e(@Pe, @h, [-3*pi, 3*pi], 0.01, 0.5);
[y4 t] = ct_conv_e(@Pe, @h, [-3*pi, 3*pi], 0.01, 1);
[y5 t] = ct_conv_e(@Pe, @h, [-3*pi, 3*pi], 0.01, 5);
[y6 t] = ct_conv_e(@Pe, @h, [-3*pi, 3*pi], 0.01, 10);

plot(t, y0, t, y1, t, y2, t, y3, t, y4, t, y5, t, y6)

subplot(3, 2, 4)
plot(t, y6)

% Les oscillations disparaissent avec un e élevé

% b)

function x = Qe(t, e)
  x = Pe(t-e, e) - Pe(t+e, e);
end

[y t] = ct_conv_e(@Qe, @h, [-3*pi, 3*pi], 0.01, 0.01);
subplot(3, 2, 5)
plot(t, y)

% Les oscillations disparaissent avec un e petit

pause;
