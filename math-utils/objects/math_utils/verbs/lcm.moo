@verb math_utils:lcm least_common_multiple this none this rxd
@program math_utils:lcm least_common_multiple
// $math_utils:lcm/least_common_multiple(a, b) => INT
// Least common multiple of |a| and |b|: |a*b| / gcd(a, b).
num1 = abs(args[1]);
num2 = abs(args[2]);
return num1 * num2 / this:gcd(num1, num2);
.
