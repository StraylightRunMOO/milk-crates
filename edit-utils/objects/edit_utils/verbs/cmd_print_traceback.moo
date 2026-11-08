@verb edit_utils:cmd_print_traceback this none this rxd
@program edit_utils:cmd_print_traceback
// $edit_utils:cmd_print_traceback(state) — inline-editor command.
{state} = args;
if (!state.traceback)
  player:tell("There are no recorded tracebacks.");
  return E_INVARG;
else
  player:tell("Last recorded traceback:");
  player:tell_lines(state.traceback);
endif
.
