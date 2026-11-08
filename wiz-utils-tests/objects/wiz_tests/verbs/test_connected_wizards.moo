@verb wiz_tests:test_connected_wizards this none none rxd
@program wiz_tests:test_connected_wizards
got = `$wiz_utils:connected_wizards() ! ANY => 0';
if (typeof(got) != LIST)
  return "connected => " + toliteral(got);
endif
return 1;
.
