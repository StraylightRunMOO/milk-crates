@verb ansi_tests:test_centre this none none rxd
@program ansi_tests:test_centre
got = `$ansi_utils:centre("hi", 6) ! ANY => 0';
if (got != "  hi  ")
  return "centre => " + toliteral(got);
endif
got = `$ansi_utils:center("hi", 6) ! ANY => 0';
if (got != "  hi  ")
  return "center alias => " + toliteral(got);
endif
return 1;
.
