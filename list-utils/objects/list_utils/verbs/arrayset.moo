@verb list_utils:arrayset this none this rxd
@program list_utils:arrayset
// $list_utils:arrayset(list, value, pos1[, ...posn]) => LIST
// Set list[pos1][pos2]...[posn] to value and return the modified list.
if (length(args) > 3)
  return listset(@listset(args[1..3], this:arrayset(@listset(listdelete(args, 3), args[1][args[3]], 1)), 2));
  // ... Rog's entry in the Obfuscated MOO-Code Contest...
else
  return listset(@args);
endif
.
