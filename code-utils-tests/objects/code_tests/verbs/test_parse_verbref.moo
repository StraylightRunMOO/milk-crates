@verb code_tests:test_parse_verbref this none none rxd
@program code_tests:test_parse_verbref
got = `$code_utils:parse_verbref("$code_utils:toint") ! ANY => 0';
if (typeof(got) != LIST || length(got) != 2 || got[2] != "toint")
  return "$code_utils:toint => " + toliteral(got);
endif
if (valid($code_utils) && got[1] != tostr($code_utils))
  return "object => " + toliteral(got[1]);
endif
got = `$code_utils:parse_verbref("#12:foo") ! ANY => 0';
if (got != {"#12", "foo"})
  return "#12:foo => " + toliteral(got);
endif
got = `$code_utils:parse_verbref("nocolon") ! ANY => 1';
if (got)
  return "nocolon => " + toliteral(got);
endif
return 1;
.
