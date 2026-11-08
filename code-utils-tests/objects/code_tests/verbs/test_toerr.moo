@verb code_tests:test_toerr this none none rxd
@program code_tests:test_toerr
got = `$code_utils:toerr("E_TYPE") ! ANY => 0';
if (got != E_TYPE)
  return "E_TYPE => " + toliteral(got);
endif
got = `$code_utils:toerr("PERM") ! ANY => 0';
if (got != E_PERM)
  return "PERM => " + toliteral(got);
endif
got = `$code_utils:toerr(1) ! ANY => 0';
if (got != E_TYPE)
  return "1 => " + toliteral(got);
endif
got = `$code_utils:toerr("nope") ! ANY => 0';
if (got != 1)
  return "nope => " + toliteral(got);
endif
return 1;
.
