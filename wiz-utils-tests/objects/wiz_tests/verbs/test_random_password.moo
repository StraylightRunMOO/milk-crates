@verb wiz_tests:test_random_password this none none rxd
@program wiz_tests:test_random_password
got = `$wiz_utils:random_password(8) ! ANY => 0';
if (typeof(got) != STR || length(got) != 8)
  return "len8 => " + toliteral(got);
endif
got = `$wiz_utils:random_password(0) ! ANY => 0';
if (got != E_INVARG)
  return "zero => " + toliteral(got);
endif
return 1;
.
