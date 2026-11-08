@verb quota_utils:object_overhead_bytes this none this rxd
@program quota_utils:object_overhead_bytes
// $quota_utils:object_overhead_bytes
object = args[1];
return 13 * 4 + length(object.name) + 1;
.
