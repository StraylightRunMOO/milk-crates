@verb math_utils:stats this none this rxd
@program math_utils:stats
// $math_utils:stats(@nums) => MAP
// Map of sum/mean/variance/skewness/kurtosis/std/min/max. Wraps stats().
nums = typeof(args[1]) == LIST && length(args) == 1 ? args[1] | args;
{sum, mean, variance, skewness, kurtosis} = stats(@nums);
o = ["sum" -> sum, "mean" -> mean, "variance" -> variance, "skewness" -> skewness, "kurtosis" -> kurtosis];
o["std"] = sqrt(variance);
o["min"] = min(@nums);
o["max"] = max(@nums);
return o;
.
