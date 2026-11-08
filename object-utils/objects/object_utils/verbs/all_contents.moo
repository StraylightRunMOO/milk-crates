@verb object_utils:all_contents this none this rxd
@program object_utils:all_contents
// $object_utils:all_contents(object) => LIST
// Return a list of all objects contained (at some level) by object.
for y in (res = args[1].contents)
  y.contents && (res = {@res, @this:all_contents(y)});
endfor
return res;
.
