@verb quota_tests:test_dual_cored this none none rxd
@program quota_tests:test_dual_cored
if (`$quota_utils ! ANY => #-1' != `$byte_quota_utils ! ANY => #-2')
  return "alias => " + toliteral(`$byte_quota_utils ! ANY => 0');
endif
a = `$quota_utils:value_bytes("ab") ! ANY => 0';
b = `$byte_quota_utils:value_bytes("ab") ! ANY => 0';
if (a != b)
  return "value_bytes dual => " + toliteral({a, b});
endif
return 1;
.
