@verb test_utils:finish this none none rxd
@program test_utils:finish
// $test_utils:finish
// finish() — suite map with ok = (failed == 0).
s = typeof(this.suite) == MAP && maphaskey(this.suite, "failed") ? this.suite | this:begin("anonymous");
s["ok"] = !s["failed"];
this.suite = s;
return s;
.
