@verb list_utils:sort_suspended this none this rxd
@program list_utils:sort_suspended
// $list_utils:sort_suspended(interval, list[, keys]) => LIST
// Same as :sort. interval is ignored; the builtin sort is used.
set_task_perms(caller_perms());
return sort(@args[2..$]);
.
