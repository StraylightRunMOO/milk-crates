@verb edit_utils:cmd_commentify this none this rxd
@program edit_utils:cmd_commentify
// $edit_utils:cmd_commentify(state) — inline-editor command.
{state} = args;
if (!state.arg)
  player:tell("You must include what lines you wish to comment.");
  return E_INVARG;
endif
range = this:parse_range(state.arg, length(state.text), state.ins);
if (typeof(range) == STR)
  player:tell(range);
  return E_INVARG;
endif
{start, end} = range;
for x in [start..end]
  state.text[x] = "" + toliteral(state.text[x]) + ";";
endfor
player:tell("Line", end < start ? "s" | "", " commented.");
.
