@verb convert_utils:rect_to_polar this none this rxd
@program convert_utils:rect_to_polar
// $convert_utils:rect_to_polar(x, y) => {FLOAT, FLOAT}
// Rectangular (x, y) to polar (r, theta). Angle in radians; atan(0, 0) => 0.0
{x, y} = args[1..2];
x = tofloat(x);
y = tofloat(y);
return {sqrt(x * x + y * y), `atan(y, x) ! E_INVARG => 0.0'};
.
