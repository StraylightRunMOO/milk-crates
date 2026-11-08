@verb list_utils:assoc this none this rxd
@program list_utils:assoc
// $list_utils:assoc(target, list[, index]) => LIST
// First sublist whose index-th element is target. {} if none. Index defaults to 1.
return assoc(@args);
.
