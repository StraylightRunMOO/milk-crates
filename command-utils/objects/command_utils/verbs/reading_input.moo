@verb command_utils:reading_input this none this rxd
@program command_utils:reading_input
// $command_utils:reading_input(who) => INT
// While input is being read() from a player, return 1. Otherwise return 0.
{who} = args;
return `who.reading_input ! ANY => 0';
.
