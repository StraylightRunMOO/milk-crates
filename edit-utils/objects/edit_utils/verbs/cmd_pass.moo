@verb edit_utils:cmd_pass this none this rxd
@program edit_utils:cmd_pass
// $edit_utils:cmd_pass(state) — inline-editor command.
{state} = args;
passthrough = $string_utils:from_list(state.arg, " ");
force_input(player, passthrough);
suspend(0);
while ($command_utils:reading_input(player) && player:is_listening())
  yield;
endwhile
.
