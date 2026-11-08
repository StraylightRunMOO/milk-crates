@verb math_utils:norm this none this rxd
@program math_utils:norm
// $math_utils:norm(@components) => INT
// Euclidean norm sqrt(a^2+b^2+...) as INT, scaled to avoid overflow.
m = max(max(@args), -min(@args));
logm = length(tostr(m));
if (logm <= 4)
  s = 0;
  for a in (args)
    s = s + a * a;
  endfor
  return toint(sqrt(tofloat(s)));
else
  factor = toint("1" + "0000000"[1..logm - 4]);
  s = 0;
  for a in (args)
    a = a / factor;
    s = s + a * a;
  endfor
  return toint(sqrt(tofloat(s))) * factor;
endif
.
