@verb code_tests:test_full_prep this none none rxd
@program code_tests:test_full_prep
got = `$code_utils:full_prep("with") ! ANY => 0';
if (got != "with/using")
  return "with => " + toliteral(got);
endif
got = `$code_utils:full_prep("using") ! ANY => 0';
if (got != "with/using")
  return "using => " + toliteral(got);
endif
got = `$code_utils:full_prep("in") ! ANY => 0';
if (got != "in/inside/into")
  return "in => " + toliteral(got);
endif
got = `$code_utils:full_prep("frabulous") ! ANY => 1';
if (got)
  return "frabulous => " + toliteral(got);
endif
return 1;
.
