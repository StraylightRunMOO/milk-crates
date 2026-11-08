@verb convert_utils:F_to_R degF_to_degR this none this rxd
@program convert_utils:F_to_R degF_to_degR
// $convert_utils:F_to_R/degF_to_degR(fahrenheit) => FLOAT
// Fahrenheit to Rankine. F_to_R(0) => 459.67
return tofloat(args[1]) + 459.67;
.
