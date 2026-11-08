@verb lock_tests:test_parse_keyexp this none none rxd
@program lock_tests:test_parse_keyexp
who = player;
got = `$lock_utils:parse_keyexp(tostr(who), who) ! ANY => 0';
if (`$lock_utils.player ! ANY => 0' != who)
  return "player => " + toliteral(`$lock_utils.player ! ANY => 0');
endif
if (typeof(got) == STR)
  return 1;
elseif (typeof(got) == OBJ || typeof(got) == LIST)
  e = `$lock_utils:eval_key(got, who) ! ANY => 0';
  if (!e)
    return "eval parsed " + toliteral(got) + " => " + toliteral(e);
  endif
  return 1;
endif
return 1;
.
