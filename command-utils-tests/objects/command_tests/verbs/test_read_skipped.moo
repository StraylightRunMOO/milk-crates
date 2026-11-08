@verb command_tests:test_read_skipped this none none rxd
@program command_tests:test_read_skipped
// Live connection: yes_or_no/read/read_lines call builtin read().
code = `verb_code($command_utils, "yes_or_no") ! ANY => 0';
if (typeof(code) != LIST || !code || !index(code[1], "$command_utils:"))
  return "yes_or_no help";
endif
return 1;
.
