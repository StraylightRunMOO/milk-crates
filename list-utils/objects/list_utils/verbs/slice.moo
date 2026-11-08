@verb list_utils:slice this none this rxd
@program list_utils:slice
// $list_utils:slice(alist[, index]) => LIST
// index-th element of each sublist. index defaults to 1 and may be a list of indices.
set_thread_mode(0);
return slice(@args);
.
