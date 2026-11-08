@verb edit_utils:cmd_paste_letter this none this rxd
@program edit_utils:cmd_paste_letter
// $edit_utils:cmd_paste_letter(state) — inline-editor command.
{state} = args;
letters = {};
for x in (player.contents)
  if (x != 0 && (isa(x, $note) || isa(x, $letter)) && x:is_readable_by(player))
    letters = {@letters, x};
  endif
endfor
if (letters == {})
  player:tell("You are not carrying any notes.");
elseif (length(letters) > 1)
  player:tell("Pick a note to paste into the working text.");
  letter = letters[$command_utils:menu(letters)];
else
  letter = letters[1];
endif
.
