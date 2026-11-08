@verb code_tests:test_short_prep this none none rxd
@program code_tests:test_short_prep
got = `$code_utils:short_prep("with/using") ! ANY => 0';
if (got != "with")
  return "with/using => " + toliteral(got);
endif
got = `$code_utils:short_prep("using") ! ANY => 0';
if (got != "with")
  return "using => " + toliteral(got);
endif
got = `$code_utils:short_prep("with") ! ANY => 0';
if (got != "with")
  return "with => " + toliteral(got);
endif
got = `$code_utils:short_prep("frabulous") ! ANY => 1';
if (got)
  return "frabulous => " + toliteral(got);
endif
return 1;
.
