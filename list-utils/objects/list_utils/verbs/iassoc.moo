@verb list_utils:iassoc this none this rxd
@program list_utils:iassoc
// $list_utils:iassoc(target, list[, index]) => INT
// Index of the first matching sublist, or 0. Index defaults to 1.
return iassoc(@args);
.
