@verb math_utils:fibonacci this none this rxd
@program math_utils:fibonacci
// $math_utils:fibonacci(n) => LIST|ERR
// Fibonacci terms 0..n. E_TYPE if not INT, E_INVARG if n < 0.
if (typeof(n = args[1]) != INT)
  return E_TYPE;
elseif (n < 0)
  return E_INVARG;
else
  if (n == 0)
    return {0};
  else
    x = {0, 1};
    for i in [2..n]
      x = {@x, x[$ - 1] + x[$]};
    endfor
    return x;
  endif
endif
.
