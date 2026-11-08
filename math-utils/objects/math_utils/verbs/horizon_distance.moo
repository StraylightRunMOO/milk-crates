@verb math_utils:horizon_distance this none this rxd
@program math_utils:horizon_distance
// $math_utils:horizon_distance(alt_feet) => FLOAT
// Approximate geometric horizon in nautical miles: 1.17 * sqrt(alt).
{alt} = args;
return 1.17 * sqrt(tofloat(alt));
.
