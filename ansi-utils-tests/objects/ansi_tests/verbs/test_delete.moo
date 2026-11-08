@verb ansi_tests:test_delete this none none rxd
@program ansi_tests:test_delete
got = `$ansi_utils:delete("[red]hi") ! ANY => 0';
if (got != "hi")
  return "delete => " + toliteral(got);
endif
return 1;
.
