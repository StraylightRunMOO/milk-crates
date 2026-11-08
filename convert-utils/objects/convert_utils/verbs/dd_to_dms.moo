@verb convert_utils:dd_to_dms dh_to_hms this none this rxd
@program convert_utils:dd_to_dms dh_to_hms
// $convert_utils:dd_to_dms/dh_to_hms(degrees) => {INT, INT, FLOAT}
// Decimal degrees to {degrees, minutes, seconds}. Alias dh_to_hms for hours.
dd = tofloat(args[1]);
d = toint(dd);
m = toint((dd - tofloat(d)) * 60.0);
s = ((dd - tofloat(d)) * 60.0 - tofloat(m)) * 60.0;
return {d, m, s};
.
