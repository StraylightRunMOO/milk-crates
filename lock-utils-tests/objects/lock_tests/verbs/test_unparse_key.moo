@verb lock_tests:test_unparse_key this none none rxd
@program lock_tests:test_unparse_key
who = player;
got = `$lock_utils:unparse_key(who) ! ANY => 0';
if (typeof(got) != STR || !index(got, tostr(who)))
  return "unparse " + tostr(who) + " => " + toliteral(got);
endif
got = `$lock_utils:unparse_key(0) ! ANY => 0';
if (got != "(None.)")
  return "unparse 0 => " + toliteral(got);
endif
got = `$lock_utils:unparse_key("") ! ANY => 0';
if (got != "(None.)")
  return "unparse empty => " + toliteral(got);
endif
return 1;
.
