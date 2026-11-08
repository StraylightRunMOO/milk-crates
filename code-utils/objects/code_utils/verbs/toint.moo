@verb code_utils:toint tonum this none this rxd
@program code_utils:toint tonum
// $code_utils:toint(STR s) => INT|ERR
// => toint(s) if STR is numeric
// => E_TYPE if it isn't
return match(s = args[1], "^ *[-+]?[0-9]+ *$") ? toint(s) | E_TYPE;
.
