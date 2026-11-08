@verb command_utils:kill_if_laggy this none this rxd
@program command_utils:kill_if_laggy
// $command_utils:kill_if_laggy(cutoff [, @tell_args])
// Kills this task if the current lag is greater than cutoff. Remaining args are passed to player:tell.
cutoff = args[1];
if ($login:current_lag() > cutoff)
  player:tell(@listdelete(args, 1));
  kill_task(task_id());
endif
.
