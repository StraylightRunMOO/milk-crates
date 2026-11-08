@verb ansi_utils:index rindex this none this rxd
@program ansi_utils:index rindex
// $ansi_utils:index
// :[r]index (STR string, STR character, NUM case_matters)
// like index() and rindex() but ignores ANSI codes
return verb == "index" ? index(this:delete(args[1]), @listdelete(args, 1)) | rindex(this:delete(args[1]), @listdelete(args, 1));
.
