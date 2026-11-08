@verb math_utils:tan this none this rxd
@program math_utils:tan
// $math_utils:tan(theta) => INT|FLOAT
// FLOAT: radians via tan(). INT or {deg, min}: scaled sine/cosine from the degree table.
{theta} = args;
// Copied from Trig_Utils (#25800):tan by Obvious (#54879) Fri Nov 17 06:07:53 1995 PST
if (typeof(theta) == FLOAT)
  return tan(theta);
endif
sine = this:sin(theta);
cosine = this:cos(theta);
return (sine * 10000 + (cosine + 1) / 2) / cosine;
.
