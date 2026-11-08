@verb math_utils:sum_int sum this none this rxd
@program math_utils:sum_int sum
// $math_utils:sum_int/sum(@nums) => NUM
// Sum of INT arguments, or of a single list argument. Alias :sum.
{?total = 0, @rest} = args;
if (typeof(total) == LIST)
  {?total = 0, @rest} = total;
endif
for number in (rest)
  total = total + number;
endfor
return total;
.
