@verb object_quota_utils:creation_permitted this none this rxd
@program object_quota_utils:creation_permitted
// $object_quota_utils:creation_permitted
$recycler:check_quota_scam(args[1]);
return args[1].ownership_quota > 0;
.
