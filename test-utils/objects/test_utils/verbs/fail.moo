@verb test_utils:fail this none none rxd
@program test_utils:fail
// $test_utils:fail
// fail(msg) — record a failing assertion.
s = typeof(this.suite) == MAP && maphaskey(this.suite, "failed") ? this.suite | this:begin("anonymous");
msg = length(args) >= 1 ? tostr(args[1]) | "failed";
s["failed"] = s["failed"] + 1;
s["errors"] = {@s["errors"], msg};
this.suite = s;
return 0;
.
