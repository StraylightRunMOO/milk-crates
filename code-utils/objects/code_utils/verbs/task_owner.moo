@verb code_utils:task_owner this none this rxd
@program code_utils:task_owner
// $code_utils:task_owner(INT task_id) => OBJ|ERR
if (a = $list_utils:assoc(args[1], queued_tasks()))
  return a[5];
else
  return E_INVARG;
endif
.
