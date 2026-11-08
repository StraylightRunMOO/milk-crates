@verb command_utils:running_out_of_time this none this rxd
@program command_utils:running_out_of_time
// $command_utils:running_out_of_time() => INT
// Return true if we're running out of ticks or seconds.
return ticks_left() < 4000 || seconds_left() < 2;
// If this verb is changed make sure to change :suspend_if_needed as well.
.
