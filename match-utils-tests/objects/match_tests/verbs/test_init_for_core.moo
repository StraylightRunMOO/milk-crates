@verb match_tests:test_init_for_core this none none rxd
@program match_tests:test_init_for_core
code = `verb_code($match_utils, "init_for_core") ! ANY => 0';
if (typeof(code) != LIST || !code)
  return "no verb_code";
endif
if (length(code[1]) < 2 || code[1][1..2] != "//" || !index(code[1], "$match_utils:init_for_core"))
  return "help => " + toliteral(code[1]);
endif
mr = `$match_utils.matching_room ! ANY => 0';
if (typeof(mr) != OBJ)
  return "matching_room type => " + toliteral(mr);
endif
if (!`caller_perms().wizard ! ANY => 0')
  return 1;
endif
old = mr;
`$match_utils:init_for_core() ! ANY => 0';
now = `$match_utils.matching_room ! ANY => 0';
`$match_utils.matching_room = old ! ANY => 0';
if (typeof(now) != OBJ)
  return "after init type => " + toliteral(now);
endif
return 1;
.
