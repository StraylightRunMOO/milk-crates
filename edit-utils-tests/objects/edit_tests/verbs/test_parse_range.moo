@verb edit_tests:test_parse_range this none none rxd
@program edit_tests:test_parse_range
got = `$edit_utils:parse_range("1", 10, 1) ! ANY => 0';
if (got != {1, 1})
  return "single => " + toliteral(got);
endif
got = `$edit_utils:parse_range("1..3", 10, 1) ! ANY => 0';
if (got != {1, 3})
  return "dotdot => " + toliteral(got);
endif
got = `$edit_utils:parse_range("$", 10, 1) ! ANY => 0';
if (got != {10, 10})
  return "$ => " + toliteral(got);
endif
got = `$edit_utils:parse_range("2+3", 10, 1) ! ANY => 0';
if (got != {5, 5})
  return "plus => " + toliteral(got);
endif
got = `$edit_utils:parse_range("9..2", 10, 1) ! ANY => 0';
if (typeof(got) != STR)
  return "garbled => " + toliteral(got);
endif
return 1;
.
