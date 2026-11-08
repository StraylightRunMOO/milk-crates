@verb convert_utils:polar_to_rect this none this rxd
@program convert_utils:polar_to_rect
// $convert_utils:polar_to_rect(radius, angle) => {FLOAT, FLOAT}
// Polar (r, theta) to rectangular (x, y). Angle in radians.
{r, a} = args[1..2];
r = tofloat(r);
a = tofloat(a);
return {(r = r / (1.0 + (z2 = (z = tan(a / 2.0)) * z))) * (1.0 - z2), r * 2.0 * z};
.
