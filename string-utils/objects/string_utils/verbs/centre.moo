@verb string_utils:centre center this none this rxd
@program string_utils:centre center
// $string_utils:centre/center(string, width [, lfiller [, rfiller]]) => STR
// Pad on both sides. Negative width truncates from the right if too long.
// lfiller defaults to space; rfiller defaults to lfiller.
{text, len, ?lfill = " ", ?rfill = lfill} = args;
out = tostr(text);
abslen = abs(len);
if (length(out) < abslen)
  return this:space((abslen - length(out)) / 2, lfill) + out + this:space((abslen - length(out) + 1) / -2, rfill);
else
  return len > 0 ? out | out[1..abslen];
endif
.
