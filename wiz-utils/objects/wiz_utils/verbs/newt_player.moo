@verb wiz_utils:newt_player this none this rxd
@program wiz_utils:newt_player
// $wiz_utils:newt_player(who [ , commentary] [, temporary])
{who, ?comment = "", ?temporary = 0} = args;
if (!caller_perms().wizard)
  $error:raise(E_PERM);
elseif (length(args) < 1)
  $error:raise(E_ARGS);
else
  if (typeof(who = args[1]) != OBJ || !is_player(who))
    $error:raise(E_INVARG);
  elseif (!comment)
    player:notify("So why has this player been newted?");
    comment = $command_utils:read();
  endif
endif
.
