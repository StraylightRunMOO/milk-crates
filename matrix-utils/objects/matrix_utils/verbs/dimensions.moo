@verb matrix_utils:dimension*s this none this rxd
@program matrix_utils:dimension*s
// $matrix_utils:dimensions(M) => LIST of dimensional sizes.
l = {length(m = args[1])};
if (typeof(m[1]) == LIST)
  l = {@l, @this:dimensions(m[1])};
endif
return l;
.
