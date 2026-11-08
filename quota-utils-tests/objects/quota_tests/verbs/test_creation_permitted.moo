@verb quota_tests:test_creation_permitted this none none rxd
@program quota_tests:test_creation_permitted
got = `$quota_utils:creation_permitted(player) ! ANY => 0';
if (got != 1)
  return "wizard => " + toliteral(got);
endif
got = `$byte_quota_utils:creation_permitted(player) ! ANY => 0';
if (got != 1)
  return "byte alias => " + toliteral(got);
endif
return 1;
.
