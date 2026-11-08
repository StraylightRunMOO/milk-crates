@verb wiz_utils:flush_editors this none this rxd
@program wiz_utils:flush_editors
// $wiz_utils:flush_editors
if (!caller_perms().wizard)
  return E_PERM;
else
  fork (86400 * 7)
    this:(verb)();
  endfork
  player:tell("Flushing ancient editor sessions.");
  for x in ({$verb_editor, $note_editor, $mail_editor})
    x:do_flush(time() - 30 * 86400, 0);
    $command_utils:suspend_if_needed(0);
  endfor
endif
.
