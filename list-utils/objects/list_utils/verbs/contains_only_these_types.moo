@verb list_utils:contains_only_these_types this none this rxd
@program list_utils:contains_only_these_types
// $list_utils:contains_only_these_types(list, @types) => 0|1
// True if every element's typeof is in types.
{l, @types} = args;
if (typeof(l) != LIST)
  return 0;
endif
for e in (l)
  if (!(typeof(e) in types))
    return 0;
  endif
endfor
return 1;
.
