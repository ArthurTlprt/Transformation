function x = sq(theta,T,t)

  if( theta>1 || theta<0 )
    error('le rapport cyclique (argument 1) doit être compris entre 0 et 1')
  elseif( T<=0 )
    error('la période (argument 2) doit être strictement positive')
  endif

  x = floor(ceil(t/T+theta/2) - t/T + theta/2);

endfunction
