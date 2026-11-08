@verb list_utils:reverse_suspended this none this rxd
@program list_utils:reverse_suspended
// $list_utils:reverse_suspended(list) => LIST
// Reversed copy; suspends if the task is low on ticks.
set_task_perms(caller_perms());
return this:_reverse_suspended(@args[1]);
.
