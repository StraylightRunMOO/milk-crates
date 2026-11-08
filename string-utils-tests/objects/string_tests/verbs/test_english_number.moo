@verb string_tests:test_english_number this none none rxd
@program string_tests:test_english_number
if ($string_utils:english_ones(1) != "one" || $string_utils:english_ones(0) != "")
  return "english_ones";
endif
if ($string_utils:english_tens(21) != "twenty-one")
  return "english_tens";
endif
if ($string_utils:english_number(0) != "zero")
  return "english_number zero";
endif
if ($string_utils:english_number(21) != "twenty-one")
  return "english_number 21";
endif
if ($string_utils:english_ordinal(1) != "first")
  return "english_ordinal";
endif
if ($string_utils:ordinal(1) != "1st" || $string_utils:ordinal(11) != "11th" || $string_utils:ordinal(22) != "22nd")
  return "ordinal";
endif
if ($string_utils:group_number(1234567890) != "1,234,567,890")
  return "group_number";
endif
return 1;
.
