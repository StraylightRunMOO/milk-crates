@verb math_utils:minmax this none this rxd
@program math_utils:minmax
// $math_utils:minmax(lo, n, hi) => NUM
// Clamp n into [lo, hi]. Wraps clamp(); arg order differs from :clamp.
{lo, n, hi} = args;
return clamp(n, lo, hi);
.
