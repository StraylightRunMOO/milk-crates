@verb convert_utils:C_to_F degC_to_degF this none this rxd
@program convert_utils:C_to_F degC_to_degF
// $convert_utils:C_to_F/degC_to_degF(celsius) => FLOAT
// Celsius to Fahrenheit. C_to_F(0) => 32.0
return tofloat(args[1]) * 1.8 + 32.0;
.
