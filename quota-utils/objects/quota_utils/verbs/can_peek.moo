@verb quota_utils:can_peek this none this rxd
@program quota_utils:can_peek
// $quota_utils:can_peek
return args[1] == this.owner || $perm_utils:controls(args[1], args[2]);
.
