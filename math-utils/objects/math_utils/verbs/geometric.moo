@verb math_utils:geometric this none this rxd
@program math_utils:geometric
// $math_utils:geometric(x [, n]) => NUM|ERR
// Partial geometric series 1 + x + ... + x^n. n defaults to 5, must be > 0.
{n, ?order = 5} = args;
// Revised 2006-03-16 by Gary (#110811) to allow FLOAT x (help claimed it, code did not).
if (!(typeof(n) in {INT, FLOAT}) || typeof(order) != INT)
  return E_TYPE;
elseif (order <= 0)
  return E_INVARG;
endif
x = typeof(n) == FLOAT ? 1.0 | 1;
for i in [1..order]
  x = x + n ^ i;
endfor
return x;
.
