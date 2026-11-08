@verb math_tests:test_number_theory this none none rxd
@program math_tests:test_number_theory
if ($math_utils:gcd(12, 8) != 4)
  return "gcd 12 8 => " + toliteral($math_utils:gcd(12, 8));
endif
if ($math_utils:gcd(-12, 8) != 4)
  return "gcd neg";
endif
if ($math_utils:gcd(7, 7) != 7)
  return "gcd equal";
endif
if ($math_utils:greatest_common_divisor(9, 6) != 3)
  return "gcd alias";
endif
if ($math_utils:lcm(12, 8) != 24)
  return "lcm 12 8 => " + toliteral($math_utils:lcm(12, 8));
endif
if ($math_utils:least_common_multiple(3, 5) != 15)
  return "lcm alias";
endif
if ($math_utils:are_rel_prime(8, 9) != 1)
  return "are_rel_prime 8 9";
endif
if ($math_utils:are_rel_prime(8, 12) != 0)
  return "are_rel_prime 8 12";
endif
if ($math_utils:are_relatively_prime(15, 28) != 1)
  return "are_relatively_prime alias";
endif
if ($math_utils:is_prime(1) != 0)
  return "is_prime 1";
endif
if ($math_utils:is_prime(2) != 1)
  return "is_prime 2";
endif
if ($math_utils:is_prime(4) != 0)
  return "is_prime 4";
endif
if ($math_utils:is_prime(13) != 1)
  return "is_prime 13";
endif
if (`$math_utils:is_prime(1.5) ! ANY => 0' != E_TYPE)
  return "is_prime type";
endif
return 1;
.
