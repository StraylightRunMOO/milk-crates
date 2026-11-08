@verb building_utils:init_for_core this none this rxd
@program building_utils:init_for_core
// $building_utils:init_for_core()
// Wizard-only. Resets .classes to the stock $cored building parents.
if (caller_perms().wizard)
  `pass(@args) ! ANY => 0';
  this.classes = {$player, $room, $exit, $note, $container, $thing, $feature, $mail_recipient, $generic_help, $generic_db, $generic_utils, $generic_options};
endif
.
