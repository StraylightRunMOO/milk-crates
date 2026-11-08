@verb math_utils:root this none this rxd
@program math_utils:root
// $math_utils:root(k, value) => FLOAT|ERR
// k-th root of value. E_DIV if k == 0.
{k, value} = args;
k = tofloat(k);
value = tofloat(value);
if (k == 0.0)
  return E_DIV;
endif
return value ^ (1.0 / k);
.
