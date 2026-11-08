@verb code_tests:test_parse_propref this none none rxd
@program code_tests:test_parse_propref
got = `$code_utils:parse_propref("$code_utils.prepositions") ! ANY => 0';
if (typeof(got) != LIST || length(got) != 2 || got[2] != "prepositions")
  return "$code_utils.prepositions => " + toliteral(got);
endif
if (valid($code_utils) && got[1] != tostr($code_utils))
  return "object => " + toliteral(got[1]);
endif
got = `$code_utils:parse_propref("#12.foo") ! ANY => 0';
if (got != {"#12", "foo"})
  return "#12.foo => " + toliteral(got);
endif
got = `$code_utils:parse_propref("nodot") ! ANY => 1';
if (got)
  return "nodot => " + toliteral(got);
endif
return 1;
.
