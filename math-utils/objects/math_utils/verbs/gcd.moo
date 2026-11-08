@verb math_utils:gcd greatest_common_divisor this none this rxd
@program math_utils:gcd greatest_common_divisor
// $math_utils:gcd/greatest_common_divisor(a, b) => INT
// Greatest common divisor of |a| and |b| via Euclidean algorithm.
num1 = abs(args[1]);
num2 = abs(args[2]);
max = max(num1, num2);
min = min(num1, num2);
if (r1 = max % min)
  while (r2 = min % r1)
    min = r1;
    r1 = r2;
  endwhile
  return r1;
else
  return min;
endif
.
