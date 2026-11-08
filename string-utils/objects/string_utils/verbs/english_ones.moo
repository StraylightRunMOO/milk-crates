@verb string_utils:english_ones this none this rxd
@program string_utils:english_ones
// $string_utils:english_ones(n) => STR
// English name for 0..9. 0 => "". Used by :english_number.
numb = args[1];
ones = {"", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"};
return ones[numb + 1];
.
