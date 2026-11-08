@verb perm_tests:test_controls this none none rxd
@program perm_tests:test_controls
who = player;
got = `$perm_utils:controls(who, who) ! ANY => 0';
if (!got)
  return "wizard self => " + toliteral(got);
endif
got = `$perm_utils:controls(#-1, #-1) ! ANY => 1';
if (got)
  return "invalid #-1 => " + toliteral(got);
endif
got = `$perm_utils:controls(#-1, who) ! ANY => 1';
if (got)
  return "invalid who => " + toliteral(got);
endif
got = `$perm_utils:controls(who, #-1) ! ANY => 1';
if (got)
  return "invalid what => " + toliteral(got);
endif
return 1;
.
