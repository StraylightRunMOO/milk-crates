@verb math_utils:factorial this none this rxd
@program math_utils:factorial
// $math_utils:factorial(n) => INT|ERR
// n! for 0 <= n. E_INVARG if n < 0, E_TYPE if not INT.
if ((number = args[1]) < 0)
  return E_INVARG;
elseif (typeof(number) != INT)
  return E_TYPE;
endif
fact = 1;
for i in [2..number]
  fact = fact * i;
endfor
return fact;
.
