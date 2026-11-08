@verb math_utils:log2 this none this rxd
@program math_utils:log2
// $math_utils:log2(n) => FLOAT
// Base-2 logarithm. Wraps log2().
{n} = args;
return log2(tofloat(n));
.
