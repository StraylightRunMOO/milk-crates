@verb edit_utils:init_for_core this none this rxd
@program edit_utils:init_for_core
// $edit_utils:init_for_core()
// Wizard-only. Clears last_edits and sessions after pass(@args).
if (caller_perms().wizard)
  this.last_edits = {};
  this.sessions = {};
  pass(@args);
endif
.
