@verb math_utils:halton this none this rxd
@program math_utils:halton
// $math_utils:halton(count) => LIST
// 2-D Halton points {{x, y}, ...} of length count.
{c} = args;
x = this:halton1d(7.0, c);
y = this:halton1d(3.0, c);
o = {};
i = 1;
while (length(o) < c)
  o = {@o, {x[i] * 2, y[i]}};
  i = i + 1;
endwhile
return o;
.
