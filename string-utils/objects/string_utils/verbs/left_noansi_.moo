@verb string_utils:left(noansi) this none this rxd
@program string_utils:left(noansi)
// $string_utils:left(noansi)(string, width [, filler]) => STR
// ANSI-free :left. Pad on the right; negative width truncates from the right.
{text, len, ?fill = " "} = args;
abslen = abs(len);
out = tostr(text);
if (length(out) < abslen)
  return out + this:space(abslen - length(out), fill);
else
  return len > 0 ? out | out[1..abslen];
endif
.
