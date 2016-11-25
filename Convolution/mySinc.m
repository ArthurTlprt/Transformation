function x = mySinc(t)
  if t~=0
    x = sin(t)./t;
  else
    x = 1;
  end
end
