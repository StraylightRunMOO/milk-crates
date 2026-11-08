@verb string_utils:space this none this rxd
@program string_utils:space
// $string_utils:space(len [, fill]) => STR|E_INVARG
// abs(len) copies of fill (default space). Negative len right-anchors fill.
// STR len uses length(len). abs(len) > 1000 => E_INVARG. Uses repeat().
{n, ?fill = " "} = args;
if (typeof(n) == STR)
  n = length(n);
endif
if (typeof(n) != INT)
  return E_INVARG;
endif
alen = abs(n);
if (alen > 1000)
  return E_INVARG;
endif
if (alen == 0)
  return "";
endif
chunk = fill ? tostr(fill) | " ";
s = repeat(chunk, (alen + length(chunk) - 1) / length(chunk));
if (n >= 0)
  return s[1..alen];
endif
return s[$ - alen + 1..$];
.
