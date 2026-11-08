@verb edit_utils:get_last_edit this none this xd
@program edit_utils:get_last_edit
// $edit_utils:get_last_edit
{player} = args;
return `this.last_edits[player in $list_utils:slice(this.last_edits)][3] ! ANY => 0';
.
