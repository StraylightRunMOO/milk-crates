@verb code_tests:test_toobj this none none rxd
@program code_tests:test_toobj
got = `$code_utils:toobj("#0") ! ANY => 0';
if (got != #0)
  return "#0 => " + toliteral(got);
endif
got = `$code_utils:toobj("  #-1 ") ! ANY => 0';
if (got != #-1)
  return "#-1 => " + toliteral(got);
endif
got = `$code_utils:toobj("foo") ! ANY => 0';
if (got != E_TYPE)
  return "foo => " + toliteral(got);
endif
got = `$code_utils:toobj("0") ! ANY => 0';
if (got != E_TYPE)
  return "0 => " + toliteral(got);
endif
return 1;
.
