@verb list_utils:randomly_permute_suspended this none this rxd
@program list_utils:randomly_permute_suspended
// $list_utils:randomly_permute_suspended(list) => LIST
// Shuffled copy; suspends if the task is low on ticks.
set_task_perms(caller_perms());
$command_utils:suspend_if_needed(0);
return shuffle(args[1]);
.
