@verb quota_utils:verb_overhead_bytes this none this rxd
@program quota_utils:verb_overhead_bytes
// $quota_utils:verb_overhead_bytes
o = args[1];
vs = verbs(o);
return length(vs) * 5 * 4;
.
