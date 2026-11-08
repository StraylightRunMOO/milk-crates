@verb object_quota_utils:init_for_core this none this rxd
@program object_quota_utils:init_for_core
// $object_quota_utils:init_for_core
if (!caller_perms().wizard)
  return E_PERM;
else
  pass(@args);
  // Uncomment this if you want to send the core out with object quota.
  // $quota_utils = this
endif
.
