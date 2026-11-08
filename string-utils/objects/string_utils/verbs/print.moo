@verb string_utils:print print_suspended this none this rxd
@program string_utils:print print_suspended
// $string_utils:print/print_suspended(value) => STR
// Literal print of value. Same as toliteral(); like from_value(value, 1, -1).
return toliteral(args[1]);
.
