@verb convert_utils:dms_to_dd hms_to_dh this none this rxd
@program convert_utils:dms_to_dd hms_to_dh
// $convert_utils:dms_to_dd/hms_to_dh(deg, min, sec) => FLOAT
// Degrees/minutes/seconds to decimal degrees. Alias hms_to_dh for hours.
{d, m, s} = args[1..3];
d = tofloat(d);
m = tofloat(m);
s = tofloat(s);
return d + m / 60.0 + s / 3600.0;
.
