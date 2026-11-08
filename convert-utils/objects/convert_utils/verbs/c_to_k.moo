@verb convert_utils:C_to_K degC_to_degK this none this rxd
@program convert_utils:C_to_K degC_to_degK
// $convert_utils:C_to_K/degC_to_degK(celsius) => FLOAT
// Celsius to Kelvin using +273.0 (not 273.15). C_to_K(0) => 273.0
return tofloat(args[1]) + 273.0;
.
