@verb object_quota_utils:initialize_quota this none this rxd
@program object_quota_utils:initialize_quota
// $object_quota_utils:initialize_quota
if (!caller_perms().wizard)
  return E_PERM;
else
  args[1].ownership_quota = $wiz_utils.default_player_quota;
endif
.
