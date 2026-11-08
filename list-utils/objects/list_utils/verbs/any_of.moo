@verb list_utils:any_of this none this rxd
@program list_utils:any_of
// $list_utils:any_of(list[, value]) => INT
// With value: index of value in list, or 0. One arg: 1 if any element is true.
if (length(args) >= 2)
  return args[2] in args[1];
endif
for x in (args[1])
  if (x)
    return 1;
  endif
endfor
return 0;
.
