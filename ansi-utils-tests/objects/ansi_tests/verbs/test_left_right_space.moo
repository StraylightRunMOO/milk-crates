@verb ansi_tests:test_left_right_space this none none rxd
@program ansi_tests:test_left_right_space
got = `$ansi_utils:space(3) ! ANY => 0';
if (got != "   ")
  return "space => " + toliteral(got);
endif
got = `$ansi_utils:left("hi", 5) ! ANY => 0';
if (got != "hi   ")
  return "left => " + toliteral(got);
endif
got = `$ansi_utils:right("hi", 5) ! ANY => 0';
if (got != "   hi")
  return "right => " + toliteral(got);
endif
return 1;
.
