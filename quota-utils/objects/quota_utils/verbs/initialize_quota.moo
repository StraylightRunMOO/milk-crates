@verb quota_utils:initialize_quota this none this rxd
@program quota_utils:initialize_quota
// $quota_utils:initialize_quota
if (!caller_perms().wizard)
  return E_PERM;
else
  args[1].size_quota = this.default_quota;
  args[1].ownership_quota = this.large_negative_number;
endif
.
