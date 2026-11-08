@verb menu_tests:test_return_map_verb this none none rxd
@program menu_tests:test_return_map_verb
got = `$menu_utils:return_map_verb($menu_utils, "no_such_verb") ! ANY => 0';
if (got != "Unknown")
  return "no_such_verb => " + toliteral(got);
endif
return 1;
.
