@verb edit_tests:test_get_option this none none rxd
@program edit_tests:test_get_option
got = `$edit_utils:get_option("expert") ! ANY => -99';
if (got != 0)
  return "expert => " + toliteral(got);
endif
got = `$edit_utils:get_option("cmd_char") ! ANY => 0';
if (got != "/")
  return "cmd_char => " + toliteral(got);
endif
return 1;
.
