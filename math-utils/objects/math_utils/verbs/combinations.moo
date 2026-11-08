@verb math_utils:combinations this none this rxd
@program math_utils:combinations
// $math_utils:combinations(n, r) => INT|ERR
// C(n, r) = n! / (r! (n-r)!). 0 if r out of range.
{n, r} = args;
if (typeof(n) != INT && typeof(r) != INT)
  return E_TYPE;
endif
if (0 > (r = min(r, n - r)))
  return 0;
else
  c = 1;
  n = n + 1;
  for i in [1..r]
    c = c * (n - i) / i;
  endfor
  return c;
endif
.
