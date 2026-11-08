@verb edit_utils:is_editing this none this xd
@program edit_utils:is_editing
// $edit_utils:is_editing(player) => INT
// True when that player has a live inline-edit task in this.last_edits.
{player} = args;
return `$code_utils:task_valid(this.last_edits[player in $list_utils:slice(this.last_edits)][2]) ! ANY => 0';
.
