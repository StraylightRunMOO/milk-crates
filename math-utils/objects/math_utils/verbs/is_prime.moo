@verb math_utils:is_prime this none this rxd
@program math_utils:is_prime
// $math_utils:is_prime(n) => 0|1|ERR
// 1 if n is prime. E_TYPE if not INT. n < 2 is not prime.
if (typeof(number = args[1]) != INT)
  return E_TYPE;
endif
if (number == 2)
  return 1;
elseif (number < 2 || number % 2 == 0)
  return 0;
else
  max = toint(ceil(sqrt(tofloat(number))));
  choice = 3;
  while (choice <= max)
    if (seconds_left() < 2 || ticks_left() < 25)
      suspend(0);
    endif
    if (number % choice == 0)
      return 0;
    endif
    choice = choice + 2;
  endwhile
endif
return 1;
.
