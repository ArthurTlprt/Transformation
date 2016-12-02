function [fFast, envelope] = sinc_freq(N, theta, T)
  f = -N/T:1/T:N/T;
  spectrum = theta * sinc(f*T*theta); % avec la convention ``étrangère'' de sinc
  hold on, grid on
  stem(f,spectrum,"r") % stem est comme plot, mais utilise des raies
  fFast = -N/T:1/(4*T):N/T;
  envelope = theta * sinc(fFast*T*theta); % attention, convention
  % plot(fFast,envelope,"k")
end
