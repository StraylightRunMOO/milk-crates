@verb edit_utils:get_opt*ion this none this rxd
@program edit_utils:get_opt*ion
// $edit_utils:get_option(option [, player]) => value
// Missing player option falls back to this.default_options[option].
{option, ?player = player} = args;
nothing = `$nothing ! ANY => #-1';
opt = `player.inline_editor_options[option] ! ANY => nothing';
if (opt != nothing)
  return opt;
else
  return $edit_utils.default_options[option];
endif
.
