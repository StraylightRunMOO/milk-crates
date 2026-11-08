@verb edit_utils:cmd_list this none this rxd
@program edit_utils:cmd_list
// $edit_utils:cmd_list(state) — inline-editor command.
{state} = args;
if (!state.text)
  player:tell("No text to list.");
  return E_INVARG;
  // elseif (!state.arg)
  // player:tell("List what lines? (Line ranges from 1 to ", state.ins-1, ".)");
elseif (!state.arg)
  if (state.ins + 8 > length(state.text))
    listuntil = length(state.text);
  else
    listuntil = state.ins + 8;
  endif
  if (state.ins - 8 <= 0)
    listfrom = 1;
  else
    listfrom = state.ins - 8;
  endif
  range = {listfrom, listuntil};
else
  if (state.arg == {"all"})
    range = {1, length(state.text)};
  else
    range = this:parse_range(state.arg, length(state.text), state.ins);
    if (typeof(range) == STR)
      player:tell(range);
      return E_INVARG;
    endif
  endif
endif
.
