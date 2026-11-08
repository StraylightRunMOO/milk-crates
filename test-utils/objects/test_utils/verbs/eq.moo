@verb test_utils:eq this none none rxd
@program test_utils:eq
// $test_utils:eq
// eq(a, b [, msg]) — pass if a == b.
if (length(args) < 2)
  return this:fail("eq needs two values");
endif
a = args[1];
b = args[2];
msg = length(args) >= 3 ? tostr(args[3]) | "";
if (a == b)
  return this:ok(msg ? msg | "eq");
endif
return this:fail((msg ? msg + ": " | "") + toliteral(a) + " != " + toliteral(b));
.
