@verb quota_tests:test_value_bytes this none none rxd
@program quota_tests:test_value_bytes
got = `$quota_utils:value_bytes(0) ! ANY => -1';
if (typeof(got) != INT || got < 0)
  return "int => " + toliteral(got);
endif
got = `$quota_utils:value_bytes("ab") ! ANY => -1';
if (typeof(got) != INT || got < 2)
  return "str => " + toliteral(got);
endif
return 1;
.
