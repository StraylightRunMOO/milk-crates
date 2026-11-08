@verb code_utils:toobj this none this rxd
@program code_utils:toobj
// $code_utils:toobj(STR s) => OBJ|ERR
return match(s = args[1], "^ *#[-+]?[0-9]+ *$") ? toobj(s) | E_TYPE;
.
