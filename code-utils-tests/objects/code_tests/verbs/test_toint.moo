@verb code_tests:test_toint this none none rxd
@program code_tests:test_toint
got = `$code_utils:toint("42") ! ANY => 0';
if (got != 42)
  return "42 => " + toliteral(got);
endif
got = `$code_utils:toint("  -7 ") ! ANY => 0';
if (got != -7)
  return "-7 => " + toliteral(got);
endif
got = `$code_utils:toint("+3") ! ANY => 0';
if (got != 3)
  return "+3 => " + toliteral(got);
endif
got = `$code_utils:toint("foo") ! ANY => 0';
if (got != E_TYPE)
  return "foo => " + toliteral(got);
endif
got = `$code_utils:toint("3.14") ! ANY => 0';
if (got != E_TYPE)
  return "3.14 => " + toliteral(got);
endif
got = `$code_utils:tonum("9") ! ANY => 0';
if (got != 9)
  return "tonum => " + toliteral(got);
endif
return 1;
.
