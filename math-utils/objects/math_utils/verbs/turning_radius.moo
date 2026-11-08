@verb math_utils:turning_radius this none this rxd
@program math_utils:turning_radius
// $math_utils:turning_radius(speed, bank_angle_deg) => {FLOAT,FLOAT}
// Aviation approximation: {turn radius, turn rate}.
{speed, bank_angle} = args;
speed = tofloat(speed);
bank_angle = tofloat(bank_angle);
angle = tan(this:deg2rads(bank_angle));
radius = speed ^ 2.0 / (11.26 * angle);
rate = 1091.0 * angle / speed;
return {radius, rate};
.
