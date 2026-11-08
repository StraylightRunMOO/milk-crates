@verb convert_utils:K_to_C degK_to_degC this none this rxd
@program convert_utils:K_to_C degK_to_degC
// $convert_utils:K_to_C/degK_to_degC(kelvin) => FLOAT
// Kelvin to Celsius using -273.0 (not 273.15). K_to_C(273) => 0.0
return tofloat(args[1]) - 273.0;
.
