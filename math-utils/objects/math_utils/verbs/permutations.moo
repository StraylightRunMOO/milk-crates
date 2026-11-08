@verb math_utils:permutations this none this rxd
@program math_utils:permutations
// $math_utils:permutations(n, r) => INT|ERR
// P(n, r) = n! / (n-r)!. 0 if r < 1 or r > n.
{n, r} = args;
if (typeof(n) != INT && typeof(r) != INT)
  return E_TYPE;
endif
if (r < 1 || (diff = n - r) < 0)
  return 0;
else
  p = n;
  for i in [diff + 1..n - 1]
    p = p * i;
  endfor
  return p;
endif
.
