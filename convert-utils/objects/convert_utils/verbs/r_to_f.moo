@verb convert_utils:R_to_F degR_to_degF this none this rxd
@program convert_utils:R_to_F degR_to_degF
// $convert_utils:R_to_F/degR_to_degF(rankine) => FLOAT
// Rankine to Fahrenheit. R_to_F(459.67) => 0.0
return tofloat(args[1]) - 459.67;
.
