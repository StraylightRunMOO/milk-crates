@verb string_tests:test_numeric this none none rxd
@program string_tests:test_numeric
if (!$string_utils:is_numeric("42") || $string_utils:is_numeric("nope"))
  return "is_numeric 42/nope";
endif
if (!$string_utils:is_numeric(42) || !$string_utils:is_numeric(1.5))
  return "is_numeric INT/FLOAT";
endif
if (!$string_utils:is_integer("42") || $string_utils:is_integer("1.5") || $string_utils:is_integer(42))
  return "is_integer";
endif
if (!$string_utils:is_integer("  -3  "))
  return "is_integer spaces";
endif
if (!$string_utils:is_float("1.5") || $string_utils:is_float("42"))
  return "is_float";
endif
if (!$string_utils:is_numeric("1.5e2"))
  return "is_numeric exp";
endif
return 1;
.
