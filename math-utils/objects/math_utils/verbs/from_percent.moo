@verb math_utils:from_percent from_percentage this none this rxd
@program math_utils:from_percent from_percentage
// $math_utils:from_percent/from_percentage(pct, whole) => FLOAT
// pct percent of whole.
{pct, whole} = args;
return tofloat(pct) / 100.0 * tofloat(whole);
.
