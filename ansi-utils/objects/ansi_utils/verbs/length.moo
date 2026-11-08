@verb ansi_utils:length this none this rxd
@program ansi_utils:length
// $ansi_utils:length(string) => INT
// Visible width of string after ANSI codes are stripped.
return length(index(a = args[1], "[") ? this:delete(a) | a);
.
