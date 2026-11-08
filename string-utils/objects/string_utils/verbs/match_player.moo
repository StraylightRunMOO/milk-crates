@verb string_utils:match_player this none this rxd
@program string_utils:match_player
// $string_utils:match_player(name, name, ...) => LIST
// $string_utils:match_player(name [, meobj]) => OBJ
// $string_utils:match_player({name, ...} [, meobj]) => LIST
// Players, $failed_match, $ambiguous_match, or $nothing for "".
// meobj is what "me" returns (default player; non-player => $failed_match).
retstr = 0;
me = player;
if (length(args) < 2 || typeof(me = args[2]) == OBJ)
  me = valid(me) && is_player(me) ? me | `$failed_match ! ANY => #-3';
  if (typeof(args[1]) == STR)
    strings = {args[1]};
    retstr = 1;
    // return a string, not a list
  else
    strings = args[1];
  endif
else
  strings = args;
  me = player;
endif
found = {};
for astr in (strings)
  if (!astr)
    aobj = `$nothing ! ANY => #-1';
  elseif (astr == "me")
    aobj = me;
  else
    if (valid(aobj = $string_utils:literal_object(astr)) && is_player(aobj))
      // astr is a valid literal object number of some player, so we are done.
    else
      aobj = $player_db:find(astr);
    endif
  endif
  found = {@found, aobj};
endfor
return retstr ? found[1] | found;
.
