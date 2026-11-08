@verb math_utils:mean average this none this rxd
@program math_utils:mean average
// $math_utils:mean/average(@nums) => NUM
// Arithmetic mean of the arguments, or of a single list argument.
return this:sum(rlist = typeof(args[1]) == LIST ? args[1] | args) / length(rlist);
.
