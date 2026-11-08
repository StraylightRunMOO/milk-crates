@verb match_utils:match this none this rxd
@program match_utils:match
// $match_utils:match(string, object-list) => OBJ
// Return the object in object-list aliased to string.
// "5th axe" is the fifth alias match; "where's sai" / "my third dagger" are possessives.
// Ordinal is position in object-list, or in the possessor's contents when a possessive is given.
// Empty string => $nothing (#-1). "me" => player; "here" => player.location.
{string, olist} = args;
if (!string)
  return `$nothing ! ANY => #-1';
elseif (string == "me")
  return player;
else
  if (string == "here")
    return `player.location ! ANY => #-1';
  elseif (valid(object = $string_utils:literal_object(string)))
    return object;
  else
    if (valid(object = $string_utils:match(string, olist, "aliases")))
      return object;
    elseif (parsed = this:parse_ordinal_reference(string))
      return this:match_nth(parsed[2], olist, parsed[1]);
    else
      if (parsed = this:parse_possessive_reference(string))
        {whostr, objstr} = parsed;
        if (valid(whose = this:match(whostr, olist)))
          return this:match(objstr, `whose.contents ! ANY => {}');
        else
          return whose;
        endif
      else
        return object;
      endif
    endif
  endif
endif
.

