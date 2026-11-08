@verb math_utils:AND XOR this none this rxd
@program math_utils:AND XOR
// $math_utils:AND/XOR(x, y) => INT|ERR
// Bitwise AND or XOR on integers. 12 AND 10 => 8, 12 XOR 10 => 6. E_TYPE if not INT.
{x, y} = args;
if (typeof(x) != INT || typeof(y) != INT)
  return E_TYPE;
endif
return verb == "XOR" ? x ^. y | x & y;
.
