@verb math_utils:precision this none this rxd
@program math_utils:precision
// $math_utils:precision(number, digits) => FLOAT
// Round number to the given digits after the decimal.
{digits, pre} = args;
mult = 10.0 ^ pre;
return this:rint(digits * mult) / mult;
.
