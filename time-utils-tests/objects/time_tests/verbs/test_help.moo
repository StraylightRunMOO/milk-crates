@verb time_tests:test_help this none none rxd
@program time_tests:test_help
code = `verb_code($time_utils, "to_seconds") ! ANY => 0';
if (typeof(code) != LIST || !code)
  return "no verb_code";
endif
if (length(code[1]) < 2 || code[1][1..2] != "//" || !index(code[1], "$time_utils:to_seconds"))
  return "to_seconds help => " + toliteral(code[1]);
endif
dh = `verb_code($time_utils, "dhms") ! ANY => 0';
if (typeof(dh) != LIST || !dh || length(dh[1]) < 2 || dh[1][1..2] != "//" || !index(dh[1], "$time_utils:dhms"))
  return "dhms help => " + toliteral(typeof(dh) == LIST && dh ? dh[1] | dh);
endif
su = `verb_code($time_utils, "sun") ! ANY => 0';
if (typeof(su) != LIST || !su || length(su[1]) < 2 || su[1][1..2] != "//" || !index(su[1], "$time_utils:sun"))
  return "sun help => " + toliteral(typeof(su) == LIST && su ? su[1] | su);
endif
return 1;
.
