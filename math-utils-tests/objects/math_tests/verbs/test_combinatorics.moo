@verb math_tests:test_combinatorics this none none rxd
@program math_tests:test_combinatorics
if ($math_utils:factorial(0) != 1)
  return "factorial 0";
endif
if ($math_utils:factorial(5) != 120)
  return "factorial 5 => " + toliteral($math_utils:factorial(5));
endif
if (`$math_utils:factorial(-1) ! ANY => 0' != E_INVARG)
  return "factorial neg => " + toliteral(`$math_utils:factorial(-1) ! ANY => 0');
endif
if (`$math_utils:factorial(1.5) ! ANY => 0' != E_TYPE)
  return "factorial type";
endif
if ($math_utils:fibonacci(0) != {0})
  return "fibonacci 0";
endif
if ($math_utils:fibonacci(1) != {0, 1})
  return "fibonacci 1";
endif
if ($math_utils:fibonacci(5) != {0, 1, 1, 2, 3, 5})
  return "fibonacci 5 => " + toliteral($math_utils:fibonacci(5));
endif
if (`$math_utils:fibonacci(-1) ! ANY => 0' != E_INVARG)
  return "fibonacci neg";
endif
if ($math_utils:combinations(5, 2) != 10)
  return "C(5,2) => " + toliteral($math_utils:combinations(5, 2));
endif
if ($math_utils:combinations(5, 0) != 1)
  return "C(5,0)";
endif
if ($math_utils:combinations(5, 6) != 0)
  return "C(5,6)";
endif
if ($math_utils:permutations(5, 2) != 20)
  return "P(5,2) => " + toliteral($math_utils:permutations(5, 2));
endif
if ($math_utils:permutations(5, 5) != 120)
  return "P(5,5)";
endif
if ($math_utils:permutations(5, 0) != 0)
  return "P(5,0)";
endif
return 1;
.
