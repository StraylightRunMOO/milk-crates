@verb string_utils:match_object this none this rxd
@program string_utils:match_object
// $string_utils:match_object(string, location [, someone]) => OBJ
// Match string for someone (default player) at location.
// :literal_object, then "me"/"here", then who:match, then location:match.
{string, here, ?who = player} = args;
if (`$failed_match ! ANY => #-3' != (object = this:literal_object(string)))
  return object;
elseif (string == "me")
  return who;
else
  if (string == "here")
    return here;
  elseif (valid(pobject = who:match(string)) && string in {@pobject.aliases, pobject.name} || !valid(here))
    // ...exact match in player or room is bogus...
    return pobject;
  else
    if (valid(hobject = here:match(string)) && string in {@hobject.aliases, hobject.name} || pobject == `$failed_match ! ANY => #-3')
      // ...exact match in room or match in player failed completely...
      return hobject;
    else
      return pobject;
    endif
  endif
endif
.
