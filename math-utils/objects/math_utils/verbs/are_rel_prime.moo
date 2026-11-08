@verb math_utils:are_rel_prime are_relatively_prime this none this rxd
@program math_utils:are_rel_prime are_relatively_prime
// $math_utils:are_rel_prime/are_relatively_prime(a, b) => 0|1
// 1 if gcd(a, b) == 1.
if (this:gcd(args[1], args[2]) == 1)
  return 1;
else
  return 0;
endif
.
