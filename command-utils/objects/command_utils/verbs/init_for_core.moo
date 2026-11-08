@verb command_utils:init_for_core this none this rxd
@program command_utils:init_for_core
// $command_utils:init_for_core()
// Wizard-only. Resets lag_samples and feature_task after pass(@args).
if (caller_perms().wizard)
  pass(@args);
  this.lag_samples = {};
  this.feature_task = "hey, neat, no feature verbs have been run yet!";
endif
.
