@verb string_utils:is_integer this none this rxd
@program string_utils:is_integer
// $string_utils:is_integer(string) => 0|1
// True if string is a signed integer, optional surrounding spaces.
return typeof(args[1]) == STR && match(args[1], "^ *[-+]?[0-9]+ *$") ? 1 | 0;
.
