@verb match_tests:test_match_verb this none none rxd
@program match_tests:test_match_verb
got = `$match_utils:match_verb("match", $match_utils, {}) ! ANY => -1';
if (got != 0)
  return "this-none-this => " + toliteral(got);
endif
got = `$match_utils:match_verb("no_such_verb", $match_utils, {}) ! ANY => -1';
if (got != 0)
  return "missing => " + toliteral(got);
endif
got = `$match_utils:match_verb("cmd_probe", this, {}) ! ANY => 0';
if (got != 1)
  return "cmd_probe => " + toliteral(got);
endif
return 1;
.
