@verb list_utils:_reverse_suspended this none this rxd
@program list_utils:_reverse_suspended
// $list_utils:_reverse_suspended(@list) => LIST
// Reversed copy; suspends if the task is low on ticks. Private helper.
set_task_perms(caller_perms());
$command_utils:suspend_if_needed(0);
return reverse(args);
.
