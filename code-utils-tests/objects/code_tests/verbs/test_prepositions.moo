@verb code_tests:test_prepositions this none none rxd
@program code_tests:test_prepositions
got = `$code_utils:prepositions() ! ANY => 0';
if (typeof(got) != LIST || !got)
  return "prepositions => " + toliteral(got);
endif
if (!("with/using" in got))
  return "missing with/using => " + toliteral(got);
endif
return 1;
.
