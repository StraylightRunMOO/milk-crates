@verb command_tests:test_task_info this none none rxd
@program command_tests:test_task_info
got = `$command_utils:task_info(0) ! ANY => 0';
if (got != E_INVARG)
  return "task_info 0 => " + toliteral(got);
endif
return 1;
.
