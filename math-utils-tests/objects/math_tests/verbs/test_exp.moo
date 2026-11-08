@verb math_tests:test_exp this none none rxd
@program math_tests:test_exp
if ($math_utils:exp(0.0) != 1.0)
  return "exp 0.0 => " + toliteral($math_utils:exp(0.0));
endif
ex = $math_utils:exp(1.0);
if (typeof(ex) != FLOAT || abs(ex - $math_utils.e) > 1e-07)
  return "exp 1.0 => " + toliteral(ex);
endif
ei = $math_utils:exp(0);
if (typeof(ei) != LIST || ei[1] != 1)
  return "exp INT 0 => " + toliteral(ei);
endif
if ($math_utils:aexp(0) != 10000)
  return "aexp 0 => " + toliteral($math_utils:aexp(0));
endif
if ($math_utils:log2(8) != 3.0)
  return "log2 8 => " + toliteral($math_utils:log2(8));
endif
if ($math_utils:log2(1.0) != 0.0)
  return "log2 1";
endif
if ($math_utils:geometric(0.5, 2) != 1.75)
  return "geometric 0.5 2 => " + toliteral($math_utils:geometric(0.5, 2));
endif
if ($math_utils:geometric(0, 3) != 1)
  return "geometric INT 0";
endif
if (`$math_utils:geometric(0.5, 0) ! ANY => 0' != E_INVARG)
  return "geometric n<=0";
endif
return 1;
.
