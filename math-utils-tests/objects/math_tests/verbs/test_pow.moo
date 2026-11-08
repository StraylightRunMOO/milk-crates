@verb math_tests:test_pow this none none rxd
@program math_tests:test_pow
if ($math_utils:pow(2, 10) != 1024)
  return "pow 2^10 => " + toliteral($math_utils:pow(2, 10));
endif
if ($math_utils:pow(2, 0) != 1)
  return "pow 2^0";
endif
if (`$math_utils:pow(2, -1) ! ANY => 0' != E_INVARG)
  return "pow n<0";
endif
if (`$math_utils:pow(2, 1.5) ! ANY => 0' != E_TYPE)
  return "pow int^float type";
endif
if ($math_utils:sqrt(9) != 3)
  return "sqrt INT 9 => " + toliteral($math_utils:sqrt(9));
endif
if ($math_utils:sqrt(9.0) != 3.0)
  return "sqrt FLOAT 9 => " + toliteral($math_utils:sqrt(9.0));
endif
s2 = $math_utils:sqrt(2.0);
if (typeof(s2) != FLOAT || s2 < 1.4 || s2 > 1.5)
  return "sqrt 2.0 => " + toliteral(s2);
endif
if ($math_utils:clamp(5, 0, 3) != 3)
  return "clamp 5 0 3 => " + toliteral($math_utils:clamp(5, 0, 3));
endif
if ($math_utils:clamp(-1, 0, 3) != 0)
  return "clamp lo";
endif
if ($math_utils:clamp(2, 0, 3) != 2)
  return "clamp mid";
endif
if ($math_utils:minmax(0, 5, 3) != 3)
  return "minmax 0 5 3 => " + toliteral($math_utils:minmax(0, 5, 3));
endif
if ($math_utils:minmax(0, -1, 3) != 0)
  return "minmax lo";
endif
r = $math_utils:root(2, 9);
if (typeof(r) != FLOAT || abs(r - 3.0) > 1e-07)
  return "root 2 9 => " + toliteral(r);
endif
if (`$math_utils:root(0, 9) ! ANY => 0' != E_DIV)
  return "root k=0";
endif
return 1;
.
