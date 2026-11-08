@verb list_utils:prefix this none this rxd
@program list_utils:prefix
// $list_utils:prefix(list, prefix[, suffix]) => LIST
// tostr(prefix, element, suffix) for each element. Non-list arg wrapped as {arg}.
{lines, ?pre = "", ?suf = ""} = args;
if (typeof(lines) != LIST)
  lines = {lines};
endif
out = {};
for line in (lines)
  out = {@out, tostr(pre, line, suf)};
endfor
return out;
.
