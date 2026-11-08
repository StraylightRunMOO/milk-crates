@verb string_tests:test_password this none none rxd
@program string_tests:test_password
p = $string_utils:generate_password();
if (typeof(p) != STR || length(p) != 12)
  return "default length => " + toliteral(p);
endif
p8 = $string_utils:generate_password(8);
if (typeof(p8) != STR || length(p8) != 8)
  return "length 8 => " + toliteral(p8);
endif
if (`$string_utils:generate_password(3) ! ANY => E_INVARG' != E_INVARG)
  return "too short";
endif
return 1;
.
