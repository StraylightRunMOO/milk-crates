@verb ansi_utils:remove_noansi this none this rxd
@program ansi_utils:remove_noansi
// $ansi_utils:remove_noansi()
// Start translating the ANSI codes from the current task again
this.noansi_queue = setremove(this.noansi_queue, task_id());
.
