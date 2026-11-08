@verb test_utils:ne this none none rxd
@program test_utils:ne
// $test_utils:ne
// ne(a, b [, msg]) — pass if a != b.
if (length(args) < 2)
  return this:fail("ne needs two values");
endif
a = args[1];
b = args[2];
msg = length(args) >= 3 ? tostr(args[3]) | "";
if (a != b)
  return this:ok(msg ? msg | "ne");
endif
return this:fail((msg ? msg + ": " | "") + "both " + toliteral(a));
.
