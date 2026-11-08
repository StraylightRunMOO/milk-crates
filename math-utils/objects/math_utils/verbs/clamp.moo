@verb math_utils:clamp this none this rxd
@program math_utils:clamp
// $math_utils:clamp(x, lo, hi) => NUM
// Clamp x into [lo, hi]. Wraps clamp().
{x, lo, hi} = args;
return clamp(x, lo, hi);
.
