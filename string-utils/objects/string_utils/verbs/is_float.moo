@verb string_utils:is_float this none this rxd
@program string_utils:is_float
// $string_utils:is_float(string) => 0|LIST
// Truthy match if string is a signed float (decimal and/or exponent).
return match(args[1], "^ *[-+]?%(%([0-9]+%.[0-9]*%|[0-9]*%.[0-9]+%)%(e[-+]?[0-9]+%)?%)%|%([0-9]+e[-+]?[0-9]+%) *$");
.
