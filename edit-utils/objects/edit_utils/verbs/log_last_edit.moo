@verb edit_utils:log_last_edit this none this xd
@program edit_utils:log_last_edit
// $edit_utils:log_last_edit
{player, task} = args;
this:refresh_last_edits();
if (pos = player in $list_utils:slice(this.last_edits))
  this.last_edits[pos][2] = task;
  this.last_edits[pos][3] = ftime();
else
  this.last_edits = setadd(this.last_edits, {player, task, ftime()});
endif
.
