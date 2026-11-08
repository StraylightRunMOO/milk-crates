@verb code_utils:display_callers this none this rxd
@program code_utils:display_callers
// $code_utils:display_callers([callers() style list])
// Displays the output of the given callers() style list. Uses callers() if no argument is passed.
call = caller_perms() == player ? "notify_lines" | "tell_lines";
player:(call)(this:callers_text(@args));
.
