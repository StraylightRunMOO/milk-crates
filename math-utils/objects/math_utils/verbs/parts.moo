@verb math_utils:parts this none this rxd
@program math_utils:parts
// $math_utils:parts(n, q [, i]) => {INT,INT}|ERR
// Decompose n/q as {integer, fraction} with i digits after the decimal (default 5).
{n, q, ?i = 5} = args;
if (typeof(n) != INT && typeof(q) != INT && typeof(i) != INT)
  return E_TYPE;
endif
parts = {n / q, n % q};
return {parts[1], parts[2] * 10 ^ i / q};
.
