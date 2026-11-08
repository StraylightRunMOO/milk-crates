@verb math_utils:random_range this none this rxd
@program math_utils:random_range
// $math_utils:random_range(range [, mean]) => INT|ERR
// Random integer in mean-range .. mean+range. mean defaults to 0.
{range, ?mean = 0} = args;
if (typeof(range) != INT && typeof(mean) != INT)
  return E_TYPE;
endif
return mean + (random(2) == 1 ? -1 | 1) * this:random(range);
.
