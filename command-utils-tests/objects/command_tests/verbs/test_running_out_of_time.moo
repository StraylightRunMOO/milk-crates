@verb command_tests:test_running_out_of_time this none none rxd
@program command_tests:test_running_out_of_time
got = `$command_utils:running_out_of_time() ! ANY => 1';
if (got)
  return "running_out_of_time => " + toliteral(got);
endif
return 1;
.
