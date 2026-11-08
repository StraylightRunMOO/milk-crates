@verb math_utils:pow this none this rxd
@program math_utils:pow
// $math_utils:pow(x, n) => NUM|ERR
// x raised to n. E_INVARG if n < 0. E_TYPE if INT x and FLOAT n.
{x, n} = args;
if (n < 0)
  return E_INVARG;
elseif (typeof(x) == INT && typeof(n) == FLOAT)
  return E_TYPE;
endif
return x ^ n;
.
