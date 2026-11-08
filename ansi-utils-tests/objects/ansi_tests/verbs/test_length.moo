@verb ansi_tests:test_length this none none rxd
@program ansi_tests:test_length
got = `$ansi_utils:length("hello") ! ANY => 0';
if (got != 5)
  return "plain => " + toliteral(got);
endif
got = `$ansi_utils:length("[red]hi") ! ANY => 0';
if (got != 2)
  return "codes => " + toliteral(got);
endif
return 1;
.
