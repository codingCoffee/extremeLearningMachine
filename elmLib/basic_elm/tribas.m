
## Author: Ameya Shenoy <shenoy.ameya@gmail.com>


function a = tribas(n)

  if -1 <= n <= 1
  	a = 1 - abs(n);
  else
  	a = 0;
  endif

endfunction