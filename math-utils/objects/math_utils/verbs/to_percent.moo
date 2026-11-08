@verb math_utils:to_percent to_percentage this none this rxd
@program math_utils:to_percent to_percentage
// $math_utils:to_percent/to_percentage(part, whole) => FLOAT
// part as a percentage of whole: 100 * part / whole.
{per1, per2} = args;
return tofloat(per1) / tofloat(per2) * 100.0;
.
