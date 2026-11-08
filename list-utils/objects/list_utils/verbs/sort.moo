@verb list_utils:sort this none this rxd
@program list_utils:sort
// $list_utils:sort(list[, keys]) => LIST
// Sort keys (numbers or strings) and apply that permutation to list. keys default to list.
set_thread_mode(0);
return sort(@args);
.
