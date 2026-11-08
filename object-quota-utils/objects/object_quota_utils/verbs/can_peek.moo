@verb object_quota_utils:can_peek this none this rxd
@program object_quota_utils:can_peek
// $object_quota_utils:can_peek
// Is args[1] permitted to examine args[2]'s quota information?
return $perm_utils:controls(args[1], args[2]);
.
