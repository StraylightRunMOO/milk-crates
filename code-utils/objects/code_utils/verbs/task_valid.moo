@verb code_utils:task_valid this none this rxd
@program code_utils:task_valid
// $code_utils:task_valid(INT id) => 0|1
// Return true iff there is currently a valid task with the given id.
set_task_perms(`$no_one ! ANY => player');
{id} = args;
t = $list_utils:slice(queued_tasks(), 1);
return id == task_id() || id in t || E_PERM == `kill_task(id) ! ANY';
.
