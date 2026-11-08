@verb lock_utils:match_object this none this rxd
@program lock_utils:match_object
// $lock_utils:match_object(token) => OBJ | STR
// used by $lock_utils to unparse a key expression so one can use `here' and `me' as well as doing the regular object matching.
token = args[1];
if (token == "me")
  return this.player;
elseif (token == "here")
  if (valid(this.player.location))
    return this.player.location;
  else
    return "'here' has no meaning where " + this.player.name + " is";
  endif
else
  what = this.player.location:match_object(token);
  if (what == `$failed_match ! ANY => #-3')
    return "Can't find an object named '" + token + "'";
  elseif (what == `$ambiguous_match ! ANY => #-2')
    return "Multiple objects named '" + token + "'";
  else
    return what;
  endif
endif
.
