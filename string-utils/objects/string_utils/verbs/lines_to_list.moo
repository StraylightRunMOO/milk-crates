@verb string_utils:lines_to_list enlist this none this rxd
@program string_utils:lines_to_list enlist
// $string_utils:lines_to_list/enlist(@stuff) => LIST
// Flatten nested lists into one list. Non-lists are kept as elements.
l = {};
for e in (args)
  if (typeof(e) == LIST)
    l = {@l, @this:lines_to_list(@e)};
  else
    l = {@l, e};
  endif
endfor
return l;
.
