@verb math_utils:bearing_angle this none this rxd
@program math_utils:bearing_angle
// $math_utils:bearing_angle(p1, p2) => {FLOAT,FLOAT}
// {heading_deg, pitch_deg} from p1 to p2 (2- or 3-vectors).
{p1, p2} = args;
dx = tofloat(p2[1] - p1[1]);
dy = tofloat(p2[2] - p1[2]);
dz = length(p1) >= 3 && length(p2) >= 3 ? tofloat(p2[3] - p1[3]) | 0.0;
xy = atan(dx, dy) * 57.2957795130823;
if (xy < 0.0)
  xy = xy + 360.0;
endif
if (dz == 0.0)
  return {xy, 0.0};
endif
return {xy, atan(dz, sqrt(dx * dx + dy * dy)) * 57.2957795130823};
.
