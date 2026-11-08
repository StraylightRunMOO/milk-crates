@verb math_utils:round this none this rxd
@program math_utils:round
// $math_utils:round(number, multiple) => INT
// Round number to the nearest multiple; ties round up.
{what, round} = args;
low = what / round * round;
return what < low + round / 2 ? low | low + round;
.
