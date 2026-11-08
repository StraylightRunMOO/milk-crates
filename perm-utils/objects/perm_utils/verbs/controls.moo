@verb perm_utils:controls this none this rxd
@program perm_utils:controls
// $perm_utils:controls(who, what) => 0 | 1
// Is WHO allowed to hack on WHAT?
{who, what} = args;
return valid(who) && valid(what) && (who.wizard || who == what.owner);
.
