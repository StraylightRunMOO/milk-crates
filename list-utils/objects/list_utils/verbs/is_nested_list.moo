@verb list_utils:is_nested_list this none this rxd
@program list_utils:is_nested_list
// $list_utils:is_nested_list(value) => 0|1
// True if value is a list containing at least one list.
what = args[1];
if (typeof(what) != LIST)
  return 0;
endif
for elem in (what)
  if (typeof(elem) == LIST)
    return 1;
  endif
endfor
return 0;
.
