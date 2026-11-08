@verb test_utils:ok this none none rxd
@program test_utils:ok
// $test_utils:ok
// ok([msg]) — record a passing assertion.
s = typeof(this.suite) == MAP && maphaskey(this.suite, "passed") ? this.suite | this:begin("anonymous");
s["passed"] = s["passed"] + 1;
this.suite = s;
return 1;
.
