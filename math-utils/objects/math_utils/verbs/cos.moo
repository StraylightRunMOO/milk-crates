@verb math_utils:cos this none this rxd
@program math_utils:cos
// $math_utils:cos(theta) => INT|FLOAT
// FLOAT: radians via cos(). INT or {deg, min}: degree table * 10000.
theta = args[1];
// Copied from Trig_Utils (#25800):cos by Obvious (#54879) Fri Nov 17 06:07:50 1995 PST
if (typeof(theta) == FLOAT)
  return cos(theta);
elseif (typeof(theta) == INT)
  degtheta = 90 - theta;
  mintheta = 0;
else
  if (typeof(theta) == LIST)
    degtheta = 89 - theta[1];
    mintheta = 60 - theta[2];
  else
    return;
  endif
endif
return this:sin({degtheta, mintheta});
.
