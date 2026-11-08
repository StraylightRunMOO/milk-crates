@verb math_utils:halton1d this none this rxd
@program math_utils:halton1d
// $math_utils:halton1d(base, count) => LIST
// 1-D Halton sequence of length count, rounded via :rint.
{b, c} = args;
n = 0.0;
d = 1.0;
o = {};
while (length(o) < c)
  x = d - n;
  if (x == 1)
    n = 1;
    d = d * b;
  else
    y = d / b;
    while (x <= y)
      y = y / b;
    endwhile
    n = (b + 1.0) * y - x;
  endif
  o = {@o, this:rint(n / d * tofloat(c))};
endwhile
return o;
.
