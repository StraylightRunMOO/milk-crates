@verb quota_utils:enable_create this none this rxd
@program quota_utils:enable_create
// $quota_utils:enable_create
if (caller != this && !caller_perms().wizard)
  return E_PERM;
else
  args[1].ownership_quota = 1;
endif
.
