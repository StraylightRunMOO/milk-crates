@verb test_utils_tests:test_nested_suite this none none rxd
@program test_utils_tests:test_nested_suite
old = `$test_utils.suite ! ANY => 0';
`$test_utils:begin("tmp") ! ANY => 0';
`$test_utils:eq(1, 1, "one") ! ANY => 0';
`$test_utils:ne(1, 2, "two") ! ANY => 0';
s = `$test_utils:finish() ! ANY => 0';
$test_utils.suite = old;
if (typeof(s) != MAP || !s["ok"] || s["passed"] < 2 || s["failed"] != 0)
  return "suite => " + toliteral(s);
endif
return 1;
.
