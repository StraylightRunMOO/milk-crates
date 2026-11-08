@verb string_utils:is_numeric this none this rxd
@program string_utils:is_numeric
// $string_utils:is_numeric(x) => 0|1
// True if x is INT/FLOAT, or a string of a signed integer or float.
x = args[1];
t = typeof(x);
if (t == INT || t == FLOAT)
  return 1;
endif
if (t != STR || x == "")
  return 0;
endif
return this:is_integer(x) || this:is_float(x);
.
