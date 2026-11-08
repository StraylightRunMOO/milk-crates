@verb string_utils:index_d*elimited this none this rxd
@program string_utils:index_d*elimited
// $string_utils:index_delimited(string, target [, case_matters]) => INT
// Like index() but only matches target at word boundaries (not inside alphanumerics).
args[2] = "%(%W%|^%)" + $string_utils:regexp_quote(args[2]) + "%(%W%|$%)";
return (m = match(@args)) ? m[3][1][2] + 1 | 0;
.
