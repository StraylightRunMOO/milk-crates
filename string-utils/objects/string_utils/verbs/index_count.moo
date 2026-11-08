@verb string_utils:index_count this none this rxd
@program string_utils:index_count
// $string_utils:index_count(string, substring) => INT|E_INVARG
// Number of non-overlapping occurrences. Empty substring => E_INVARG.
{s, sub} = args;
if (typeof(s) != STR || typeof(sub) != STR || sub == "")
  return E_INVARG;
endif
n = 0;
from = 1;
step = length(sub);
slen = length(s);
while (from <= slen && (i = index(s[from..$], sub)))
  n = n + 1;
  from = from + i + step - 1;
endwhile
return n;
.
