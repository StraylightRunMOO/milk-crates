@verb object_quota_utils:get_quota quota_remaining this none this rxd
@program object_quota_utils:get_quota quota_remaining
// $object_quota_utils:get_quota
if ($perm_utils:controls(caller_perms(), args[1]) || caller == this)
  return args[1].ownership_quota;
else
  return E_PERM;
endif
.
