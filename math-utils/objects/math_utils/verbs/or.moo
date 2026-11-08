@verb math_utils:OR this none this rxd
@program math_utils:OR
// $math_utils:OR(x, y) => INT|ERR
// Bitwise OR on integers. 12 OR 10 => 14. E_TYPE if not INT.
{x, y} = args;
if (typeof(x) != INT || typeof(y) != INT)
  return E_TYPE;
endif
return x | y;
.
