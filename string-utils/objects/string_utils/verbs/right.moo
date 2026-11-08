@verb string_utils:right this none this rxd
@program string_utils:right
// $string_utils:right(string, width [, filler]) => STR
// Pad on the left. Truncate from the left when longer than abs(width).
// filler defaults to space.
{text, len, ?fill = " "} = args;
abslen = abs(len);
out = tostr(text);
lenout = length(out);
if (lenout >= abslen)
  return len ? out[$ - abslen + 1..$] | out;
endif
return this:space(abslen - lenout, fill) + out;
.
