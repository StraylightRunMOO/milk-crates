@verb command_tests:test_object_match_failed this none none rxd
@program command_tests:test_object_match_failed
got = `$command_utils:object_match_failed(#-1, "") ! ANY => 0';
if (got != 1)
  return "nothing => " + toliteral(got);
endif
got = `$command_utils:object_match_failed(player, "me") ! ANY => 1';
if (got != 0)
  return "valid => " + toliteral(got);
endif
got = `$command_utils:object_match_failed(#-3, "foo") ! ANY => 0';
if (got != 1)
  return "failed_match => " + toliteral(got);
endif
return 1;
.
