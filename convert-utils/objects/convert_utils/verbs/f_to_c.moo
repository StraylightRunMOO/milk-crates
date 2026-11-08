@verb convert_utils:F_to_C degF_to_degC this none this rxd
@program convert_utils:F_to_C degF_to_degC
// $convert_utils:F_to_C/degF_to_degC(fahrenheit) => FLOAT
// Fahrenheit to Celsius. F_to_C(32) => 0.0
return (tofloat(args[1]) - 32.0) / 1.8;
.
