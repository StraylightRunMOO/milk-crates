@verb math_utils:sin this none this rxd
@program math_utils:sin
// $math_utils:sin(theta) => INT|FLOAT|ERR
// FLOAT: radians via sin(). INT or {deg, min}: degree table * 10000.
theta = args[1];
// Copied from Trig_Utils (#25800):sin by Obvious (#54879) Fri Nov 17 06:07:39 1995 PST
if (typeof(theta) == FLOAT)
  return sin(theta);
elseif (typeof(theta) == INT)
  degtheta = theta % 360;
  mintheta = 0;
else
  if (typeof(theta) == LIST)
    degtheta = theta[1] % 360;
    mintheta = theta[2] % 60;
  else
    return E_INVARG;
  endif
endif
if (mintheta < 0)
  mintheta = mintheta + 60;
  degtheta = degtheta - 1;
endif
while (degtheta < 1)
  degtheta = degtheta + 360;
endwhile
if (mintheta == 0)
  return this.sines[degtheta];
endif
lim1 = this.sines[degtheta];
lim2 = this.sines[degtheta + 1];
delta = lim2 - lim1;
result = (delta * mintheta + 30) / 60 + lim1;
return result;
.
