@verb math_utils:aexp this none this rxd
@program math_utils:aexp
// $math_utils:aexp(x) => INT
// Scaled exp: 10000 * e^(x/10000). ~0.1% for 0<x<4. Overflow => $maxint.
x = args[1];
if (x < 0)
  z = this:(verb)(-x);
  return (100000000 + z / 2) / z;
elseif (x > 1000)
  z = this:(verb)(x / 2);
  if (z > 1073741823)
    return `$maxint ! ANY => 2147483647';
    // maxint for overflows
  elseif (z > 460000)
    z = (z + 5000) / 10000 * z;
  else
    if (z > 30000)
      z = ((z + 50) / 100 * z + 50) / 100;
    else
      z = (z * z + 5000) / 10000;
    endif
  endif
  if (x % 2)
    return z + (z + 5000) / 10000;
  else
    return z;
  endif
else
  return 10000 + x + (x * x + 10000) / 20000 + (x * x * x + 300000000) / 600000000;
endif
.
