@verb math_utils:BLFromInt this none this rxd
@program math_utils:BLFromInt
// $math_utils:BLFromInt(x) => LIST|ERR
// 32-bit two's-complement bits, MSB first. E_TYPE if not INT.
if (typeof(x = args[1]) != INT)
  return E_TYPE;
endif
l = {};
for i in [0..31]
  l = {@l, x >> 31 - i & 1};
endfor
return l;
.
