@verb string_utils:match_player_or_object this none this rxd
@program string_utils:match_player_or_object
// $string_utils:match_player_or_object(@strings) => LIST
// Match each string in the room, else as a player. Only valid objects returned.
if (!args)
  return;
endif
unknowns = {};
objs = {};
// We have to do something icky here.  Parallel walk the victims and args lists.  When it's a valid object, then it's a player.  If it's an invalid object, try to get an object match from the room.  If *that* fails, complain.
for i in [1..length(args)]
  if (valid(o = player.location:match_object(args[i])))
    objs = {@objs, o};
  else
    unknowns = {@unknowns, args[i]};
  endif
endfor
victims = $string_utils:match_player(unknowns);
for i in [1..length(victims)]
  if (!valid(victims[i]))
    player:tell("Could not find ", unknowns[i], " as either an object or a player.");
  else
    objs = {@objs, victims[i]};
  endif
endfor
return objs;
.
