@verb object_quota_utils:set_quota this none this rxd
@program object_quota_utils:set_quota
// $object_quota_utils:set_quota
// Set args[1]'s quota to args[2]
{who, quota} = args;
if (caller_perms().wizard || caller == this)
  return who.ownership_quota = quota;
else
  return E_PERM;
endif
.
