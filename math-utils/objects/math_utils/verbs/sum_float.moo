@verb math_utils:sum_float this none this rxd
@program math_utils:sum_float
// $math_utils:sum_float(@nums) => FLOAT
// Sum of FLOAT arguments, or of a single list argument.
{?total = 0.0, @rest} = args;
if (typeof(total) == LIST)
  {?total = 0.0, @rest} = total;
endif
for number in (rest)
  total = total + number;
endfor
return total;
.
