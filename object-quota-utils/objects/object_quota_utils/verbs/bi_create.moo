@verb object_quota_utils:bi_create this none this rxd
@program object_quota_utils:bi_create
// $object_quota_utils:bi_create
// Calls built-in create.
set_task_perms(caller_perms());
return `create(@args) ! ANY';
.
