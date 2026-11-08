@verb string_utils:group_number this none this rxd
@program string_utils:group_number
// $string_utils:group_number(INT n [, sep_char]) => STR
// $string_utils:group_number(FLOAT n [, precision [, scientific [, sep_char]]]) => STR
// Insert commas (or sep_char) every three digits from the right. 1234567890 => "1,234,567,890".
// Float precision defaults to 4; scientific is as in floatstr(). Non-numeric => E_INVARG.
if (typeof(args[1]) == INT)
  {n, ?comma = ","} = args;
  result = "";
  sign = n < 0 ? "-" | "";
  n = tostr(abs(n));
elseif (typeof(args[1]) == FLOAT)
  {n, ?prec = 4, ?scien = 0, ?comma = ","} = args;
  sign = n < 0.0 ? "-" | "";
  n = floatstr(abs(n), prec, scien);
  i = index(n, ".");
  result = n[i..$];
  n = n[1..i - 1];
else
  return E_INVARG;
endif
while ((len = length(n)) > 3)
  result = comma + n[len - 2..len] + result;
  n = n[1..len - 3];
endwhile
return sign + n + result;
// Code contributed by SunRay
.
