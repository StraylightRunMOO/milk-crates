@verb math_utils:sqrt this none this rxd
@program math_utils:sqrt
// $math_utils:sqrt(n) => NUM
// Square root. INT input truncates toward zero (LambdaCore). Wraps sqrt().
n = args[1];
if (typeof(n) == INT)
  return toint(sqrt(tofloat(n)));
endif
return sqrt(n);
.
