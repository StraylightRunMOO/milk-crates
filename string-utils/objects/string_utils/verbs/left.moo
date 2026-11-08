@verb string_utils:left this none this rxd
@program string_utils:left
// $string_utils:left(string, width [, filler]) => STR
// Pad on the right. Truncate from the right when longer than abs(width).
// Width 0 returns the string unchanged. filler defaults to space.
{text, len, ?fill = " "} = args;
abslen = abs(len);
out = tostr(text);
if (length(out) >= abslen)
  return len ? out[1..abslen] | out;
endif
return out + this:space(abslen - length(out), fill);
.
