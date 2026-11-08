@verb test_utils:ensure this none none rxd
@program test_utils:ensure
// $test_utils:ensure
// ensure(cond [, msg]) — pass if cond is true.
cond = length(args) >= 1 ? args[1] | 0;
msg = length(args) >= 2 ? tostr(args[2]) | "ensure";
if (cond)
  return this:ok(msg);
endif
return this:fail(msg);
.
