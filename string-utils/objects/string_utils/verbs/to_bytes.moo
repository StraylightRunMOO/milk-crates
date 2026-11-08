@verb string_utils:to_bytes byte_string this none this rxd
@program string_utils:to_bytes byte_string
// $string_utils:to_bytes/byte_string(n [, sigdig]) => STR
// Human size, 1024-based. Default 2 decimal places. e.g. "12.50KB".
{n, ?sigdig = 2} = args;
neg = n < 0;
k = 1024.0;
x = tofloat(abs(n));
if (x < 1000.0)
  s = tostr(floatstr(x, sigdig), "B");
elseif ((d = x / k) < 1000.0)
  s = tostr(floatstr(d, sigdig), "KB");
else
  if ((d = x / (k * k)) < 1000.0)
    s = tostr(floatstr(d, sigdig), "MB");
  elseif ((d = x / (k * k * k)) < 1000.0)
    s = tostr(floatstr(d, sigdig), "GB");
  else
    s = tostr(floatstr(x / (k * k * k * k), sigdig), "TB");
  endif
endif
return neg ? "-" + s | s;
.
