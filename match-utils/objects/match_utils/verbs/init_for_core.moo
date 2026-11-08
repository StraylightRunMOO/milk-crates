@verb match_utils:init_for_core this none this rxd
@program match_utils:init_for_core
// $match_utils:init_for_core() => NONE
// Wizard-only core setup. pass() if an ancestor defines it, then this.matching_room = $nothing (#-1).
// No-op unless caller_perms().wizard. Does not require a matching room object to exist.
if (`caller_perms().wizard ! ANY => 0')
  `pass(@args) ! ANY => 0';
  this.matching_room = `$nothing ! ANY => #-1';
endif
.
