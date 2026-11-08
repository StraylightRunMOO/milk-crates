@verb list_utils:remove_empty_strings this none this rxd
@program list_utils:remove_empty_strings
// $list_utils:remove_empty_strings(list) => LIST
// Drop empty strings. Other values kept.
out = {};
for x in (args[1])
  if (x != "")
    out = {@out, x};
  endif
endfor
return out;
.
