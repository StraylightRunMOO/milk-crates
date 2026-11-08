@verb lock_tests:test_eval_key this none none rxd
@program lock_tests:test_eval_key
who = player;
got = `$lock_utils:eval_key(who, who) ! ANY => 0';
if (!got)
  return "self key => " + toliteral(got);
endif
got = `$lock_utils:eval_key({"!", who}, who) ! ANY => 1';
if (got)
  return "not self => " + toliteral(got);
endif
other = `$root_class ! ANY => #1';
got = `$lock_utils:eval_key({"||", who, other}, who) ! ANY => 0';
if (!got)
  return "or self => " + toliteral(got);
endif
got = `$lock_utils:eval_key(0, who) ! ANY => 0';
if (got != 1)
  return "unlocked int => " + toliteral(got);
endif
got = `$lock_utils:eval_key("", who) ! ANY => 0';
if (got != 1)
  return "unlocked str => " + toliteral(got);
endif
return 1;
.
