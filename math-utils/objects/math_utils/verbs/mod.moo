@verb math_utils:mod this none this rxd
@program math_utils:mod
// $math_utils:mod(n, d) => INT|ERR
// Remainder r with n = d*q + r, 0<=r<d if d>0, -d<r<=0 if d<0.
{n, d} = args;
if (typeof(n) != INT && typeof(d) != INT)
  return E_TYPE;
endif
return (n % d + d) % d;
.
