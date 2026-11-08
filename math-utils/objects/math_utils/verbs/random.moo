@verb math_utils:random this none this rxd
@program math_utils:random
// $math_utils:random(n) => INT|ERR
// Random integer in 0..n if n>0, or n..0 if n<0. E_TYPE if not INT.
if (typeof(prob = args[1]) != INT)
  return E_TYPE;
endif
mod = prob < 0 ? -1 | 1;
return mod * random(abs(prob + mod)) - mod;
.
