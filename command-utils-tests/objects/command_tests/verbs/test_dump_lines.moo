@verb command_tests:test_dump_lines this none none rxd
@program command_tests:test_dump_lines
got = `$command_utils:dump_lines({"a", ".b", "c"}) ! ANY => 0';
if (got != {"a", "..b", "c", "."})
  return "dump_lines => " + toliteral(got);
endif
return 1;
.
