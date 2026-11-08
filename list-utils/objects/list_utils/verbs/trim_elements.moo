@verb list_utils:trim_elements this none this rxd
@program list_utils:trim_elements
// $list_utils:trim_elements(list) => LIST
// trim() each string element; leave others.
out = {};
for e in (args[1])
  out = {@out, typeof(e) == STR ? trim(e) | e};
endfor
return out;
.
