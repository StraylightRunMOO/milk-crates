@verb string_tests:test_roman this none none rxd
@program string_tests:test_roman
if ($string_utils:roman_numerals(77) != "LXXVII" || $string_utils:roman_numerals("XCII") != 92)
  return "roman smoke";
endif
if ($string_utils:roman_numerals(4) != "IV")
  return "roman 4";
endif
if (`$string_utils:roman_numerals(0) ! ANY => E_INVARG' != E_INVARG)
  return "roman 0";
endif
return 1;
.
