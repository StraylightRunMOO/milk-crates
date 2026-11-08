@verb math_utils:exp this none this rxd
@program math_utils:exp
// $math_utils:exp(x [, n]) => FLOAT|{INT,INT}|ERR
// FLOAT: wraps exp(). INT: nth-order Taylor, n defaults to 5, result {integer, fraction} via :parts.
{x, ?n = 5} = args;
if (typeof(x) == FLOAT)
  return exp(x);
elseif (typeof(x) != INT && typeof(n) != INT)
  return E_TYPE;
endif
ex = nfact = 1;
for i in [0..n - 1]
  j = n - i;
  ex = ex * x + (nfact = nfact * j);
endfor
return this:parts(ex, nfact);
.
