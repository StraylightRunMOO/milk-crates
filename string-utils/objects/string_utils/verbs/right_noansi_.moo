@verb string_utils:right(noansi) this none this rxd
@program string_utils:right(noansi)
// $string_utils:right(noansi)(string, width [, filler]) => STR
// ANSI-free :right. Pad on the left; negative width truncates from the left.
{text, len, ?fill = " "} = args;
abslen = abs(len);
out = tostr(text);
if ((lenout = length(out)) < abslen)
  return this:space(abslen - lenout, fill) + out;
else
  return len > 0 ? out | out[$ - abslen + 1..$];
endif
.
