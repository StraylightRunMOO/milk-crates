@verb edit_utils:cmd_load this none this rxd
@program edit_utils:cmd_load
// $edit_utils:cmd_load(state) — inline-editor command.
{state} = args;
if (this:session_for(player) == `$nothing ! ANY => #-1')
  player:tell("You have no text saved.");
  return E_INVARG;
endif
if (state.text && $command_utils:yes_or_no("The current text will be lost. Are you sure you wish to load saved text?") == 0)
  player:tell("Aborted.");
  return E_INVARG;
endif
state.text = this:session_for(player).text;
player:tell("Saved text loaded.");
.
