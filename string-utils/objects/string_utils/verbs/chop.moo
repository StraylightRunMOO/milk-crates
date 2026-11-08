@verb string_utils:chop this none this rxd
@program string_utils:chop
// $string_utils:chop(string, size) => LIST|E_INVARG
// Consecutive size-length pieces. Remainder is the last element. size >= 1.
{string, size} = args;
if (typeof(string) != STR || typeof(size) != INT || size < 1)
  return E_INVARG;
endif
out = {};
while (length(string) > size)
  out = {@out, string[1..size]};
  string = string[size + 1..$];
endwhile
return {@out, string};
.
