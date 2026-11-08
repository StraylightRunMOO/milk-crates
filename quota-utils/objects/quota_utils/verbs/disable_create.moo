@verb quota_utils:disable_create this none this rxd
@program quota_utils:disable_create
// $quota_utils:disable_create
if (caller != this && !caller_perms().wizard)
  return E_PERM;
else
  args[1].ownership_quota = this.large_negative_number;
endif
.
