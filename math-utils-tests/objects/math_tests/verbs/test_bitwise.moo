@verb math_tests:test_bitwise this none none rxd
@program math_tests:test_bitwise
if ($math_utils:AND(12, 10) != 8)
  return "AND 12 10 => " + toliteral($math_utils:AND(12, 10));
endif
if ($math_utils:XOR(12, 10) != 6)
  return "XOR 12 10 => " + toliteral($math_utils:XOR(12, 10));
endif
if ($math_utils:OR(12, 10) != 14)
  return "OR 12 10 => " + toliteral($math_utils:OR(12, 10));
endif
if ($math_utils:NOT(0) != -1)
  return "NOT 0 => " + toliteral($math_utils:NOT(0));
endif
if ($math_utils:NOT(-1) != 0)
  return "NOT -1 => " + toliteral($math_utils:NOT(-1));
endif
if (`$math_utils:AND(1.0, 2) ! ANY => 0' != E_TYPE)
  return "AND type";
endif
b0 = $math_utils:BLFromInt(0);
if (length(b0) != 32)
  return "BLFromInt(0) length " + toliteral(length(b0));
endif
for b in (b0)
  if (b != 0)
    return "BLFromInt(0) => " + toliteral(b0);
  endif
endfor
b1 = $math_utils:BLFromInt(1);
if (length(b1) != 32 || b1[32] != 1)
  return "BLFromInt(1) => " + toliteral(b1);
endif
for i in [1..31]
  if (b1[i] != 0)
    return "BLFromInt(1) extra " + tostr(i);
  endif
endfor
bn = $math_utils:BLFromInt(-1);
if (length(bn) != 32)
  return "BLFromInt(-1) length " + toliteral(length(bn));
endif
for b in (bn)
  if (b != 1)
    return "BLFromInt(-1) => " + toliteral(bn);
  endif
endfor
b12 = $math_utils:BLFromInt(12);
if ($math_utils:IntFromBL(b12) != 12)
  return "IntFromBL roundtrip 12 => " + toliteral($math_utils:IntFromBL(b12));
endif
if ($math_utils:IntFromBL({1, 0, 1}) != 5)
  return "IntFromBL 101";
endif
if (`$math_utils:BLFromInt("x") ! ANY => 0' != E_TYPE)
  return "BLFromInt type";
endif
return 1;
.
