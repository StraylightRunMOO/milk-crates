@verb math_utils:divmod this none this rxd
@program math_utils:divmod
// $math_utils:divmod(n, d) => {INT,INT}|ERR
// {q, r} with n = d*q + r, 0<=r<d if d>0, -d<r<=0 if d<0.
{n, d} = args;
if (typeof(n) != INT && typeof(d) != INT)
  return E_TYPE;
endif
r = (n % d + d) % d;
q = (n - r) / d;
return {q, r};
.
