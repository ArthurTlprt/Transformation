function [y t] = ct_conv_e (f1, f2, TDOM, Ts, e)
  % Dr. Tony Richardson
  % University of Evansville
  t = [TDOM(1):Ts:TDOM(2)];
  L = length(t);
  i = round(abs(TDOM(1) - 2*TDOM(1))/Ts) + 1;
  ytmp = Ts*conv(f1(t, e),f2(t));
  if(TDOM(1) <= 0)
    y = ytmp(i:i+L-1);
  else
    y = [zeros(1,i) ytmp(1:L-i)];
  end
end
