@verb edit_utils:refresh_last_edits this none this xd
@program edit_utils:refresh_last_edits
// $edit_utils:refresh_last_edits
edits = this.last_edits;
// Clear out invalid editor sessions.
for x in (edits)
  if (!$code_utils:task_valid(x[2]) || !x[1]:is_listening())
    edits = setremove(edits, x);
  endif
endfor
this.last_edits = edits;
.
