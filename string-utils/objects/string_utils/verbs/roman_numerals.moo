@verb string_utils:roman_numerals this none this rxd
@program string_utils:roman_numerals
// $string_utils:roman_numerals(n|string) => STR|INT|E_INVARG
// Arabic 1..3999 to Roman, or Roman to Arabic. Out of range => E_INVARG.
{input} = args;
ones = {"I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"};
tens = {"X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"};
hundreds = {"C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"};
thousands = {"M", "MM", "MMM"};
if (typeof(input) == INT || this:is_integer(tostr(input)))
  n = toint(input);
  if (n < 1 || n > 3999)
    return E_INVARG;
  endif
  th = n / 1000;
  n = n - th * 1000;
  h = n / 100;
  n = n - h * 100;
  t = n / 10;
  o = n - t * 10;
  return tostr(th ? thousands[th] | "", h ? hundreds[h] | "", t ? tens[t] | "", o ? ones[o] | "");
endif
s = uppercase(tostr(input));
if (s == "")
  return E_INVARG;
endif
values = ["CM" -> 900, "CD" -> 400, "XC" -> 90, "XL" -> 40, "IX" -> 9, "IV" -> 4, "M" -> 1000, "D" -> 500, "C" -> 100, "L" -> 50, "X" -> 10, "V" -> 5, "I" -> 1];
total = 0;
i = 1;
keys = {"CM", "CD", "XC", "XL", "IX", "IV", "M", "D", "C", "L", "X", "V", "I"};
while (i <= length(s))
  matched = 0;
  for k in (keys)
    last = i + length(k) - 1;
    if (last <= length(s) && s[i..last] == k)
      total = total + values[k];
      i = last + 1;
      matched = 1;
      break;
    endif
  endfor
  if (!matched)
    return E_INVARG;
  endif
endwhile
return total;
.
