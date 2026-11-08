@verb math_utils:IntFromBL this none this rxd
@program math_utils:IntFromBL
// $math_utils:IntFromBL(bits) => INT
// Integer from a list of 0/1 bits, MSB first (unsigned accumulation).
bl = args[1];
x = 0;
for l in (bl)
  x = x * 2;
  x = x + l;
endfor
return x;
.
