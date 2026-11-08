@verb string_utils:ordinal this none this rxd
@program string_utils:ordinal
// $string_utils:ordinal(n) => STR
// Short ordinal. 1 => "1st", 2 => "2nd", 11 => "11th".
string = tostr(n = args[1]);
n = abs(n) % 100;
if (n / 10 != 1 && n % 10 in {1, 2, 3})
  return string + {"st", "nd", "rd"}[n % 10];
else
  return string + "th";
endif
.
