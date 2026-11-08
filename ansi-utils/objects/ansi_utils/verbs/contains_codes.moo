@verb ansi_utils:contains_codes this none this rx
@program ansi_utils:contains_codes
// $ansi_utils:contains_codes(STR string) => True if <string> contains any ANSI codes
return !!match(args[1], this.all_regexp);
.
