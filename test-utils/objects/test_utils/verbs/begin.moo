@verb test_utils:begin this none none rxd
@program test_utils:begin
// $test_utils:begin
// begin([name]) — start a fresh suite on this.suite.
name = length(args) >= 1 ? tostr(args[1]) | "anonymous";
this.suite = ["name" -> name, "passed" -> 0, "failed" -> 0, "errors" -> {}];
return this.suite;
.
