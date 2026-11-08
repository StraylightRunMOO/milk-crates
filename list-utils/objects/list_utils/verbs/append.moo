@verb list_utils:append this none this rxd
@program list_utils:append
// $list_utils:append(@lists) => LIST
// Concatenate all argument lists.
if (length(args) > 50)
  return {@this:append(@args[1..$ / 2]), @this:append(@args[$ / 2 + 1..$])};
endif
l = {};
for a in (args)
  l = {@l, @a};
endfor
return l;
.
