@verb math_utils:rint this none this rxd
@program math_utils:rint
// $math_utils:rint(x) => FLOAT
// Round FLOAT x to the nearest integer (ties away from 0), returned as FLOAT.
{f} = args;
return trunc(f > 0.0 ? f + 0.5 | f - 0.5);
.
