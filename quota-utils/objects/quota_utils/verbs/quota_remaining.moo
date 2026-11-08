@verb quota_utils:quota_remaining this none this rxd
@program quota_utils:quota_remaining
// $quota_utils:quota_remaining
// This wants to only be called by a wizard cuz I'm lazy.  This is just for @second-char anyway.
if (caller_perms().wizard)
  q = this:get_size_quota(args[1], 1);
  return q[1] - q[2];
endif
.
