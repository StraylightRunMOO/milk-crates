@verb command_tests:test_suspend_if_needed this none none rxd
@program command_tests:test_suspend_if_needed
got = `$command_utils:suspend_if_needed(0) ! ANY => 1';
if (got)
  return "suspend_if_needed => " + toliteral(got);
endif
return 1;
.
