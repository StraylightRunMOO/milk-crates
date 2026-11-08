@verb string_tests:test_trim this none none rxd
@program string_tests:test_trim
if ($string_utils:trim("  hi  ") != "hi")
  return "trim";
endif
if ($string_utils:triml("  hi  ") != "hi  ")
  return "triml";
endif
if ($string_utils:trimr("  hi  ") != "  hi")
  return "trimr";
endif
if ($string_utils:trim("--hi--", "-") != "hi")
  return "trim chars";
endif
return 1;
.
