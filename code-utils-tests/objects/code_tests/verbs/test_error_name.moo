@verb code_tests:test_error_name this none none rxd
@program code_tests:test_error_name
got = `$code_utils:error_name(E_TYPE) ! ANY => 0';
if (got != "E_TYPE")
  return "E_TYPE => " + toliteral(got);
endif
got = `$code_utils:error_name(E_PERM) ! ANY => 0';
if (got != "E_PERM")
  return "E_PERM => " + toliteral(got);
endif
got = `$code_utils:error_name(E_NONE) ! ANY => 0';
if (got != "E_NONE")
  return "E_NONE => " + toliteral(got);
endif
return 1;
.
