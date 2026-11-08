@verb list_utils:range this none this rxd
@program list_utils:range
// $list_utils:range([m,] n) => LIST
// {m, m+1, ..., n}. One argument means 1..n.
if (length(args) == 1)
  return range(1, args[1]);
endif
return range(args[1], args[2]);
.
