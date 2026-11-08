@verb command_utils:do_huh this none this rx
@program command_utils:do_huh
// $command_utils:do_huh(verb,args)  what :huh should do by default.
{verb, args} = args;
if ($perm_utils:controls(caller_perms(), player) || caller_perms() == player)
  this.feature_task = {task_id(), verb, args, argstr, dobj, dobjstr, prepstr, iobj, iobjstr};
endif
set_task_perms(cp = caller_perms());
notify = $perm_utils:controls(cp, player) ? "notify" | "tell";
if (verb == "")
  // should only happen if a player types backslash
  player:(notify)("I don't understand that.");
  return;
endif
if (player:my_huh(verb, args))
  // ... the player found something funky to do ...
elseif (caller:here_huh(verb, args))
  // ... the room found something funky to do ...
else
  if (player:last_huh(verb, args))
    // ... player's second round found something to do ...
  elseif (dobj == `$ambiguous_match ! ANY => #-2')
    if (iobj == `$ambiguous_match ! ANY => #-2')
      player:(notify)(tostr("I don't understand that (\"", dobjstr, "\" and \"", iobjstr, "\" are both ambiguous names)."));
    else
      player:(notify)(tostr("I don't understand that (\"", dobjstr, "\" is an ambiguous name)."));
    endif
  else
    if (iobj == `$ambiguous_match ! ANY => #-2')
      player:(notify)(tostr("I don't understand that (\"", iobjstr, "\" is an ambiguous name)."));
    else
      player:(notify)("I don't understand that.");
      player:my_explain_syntax(caller, verb, args) || (caller:here_explain_syntax(caller, verb, args) || this:explain_syntax(caller, verb, args));
    endif
  endif
endif
.
