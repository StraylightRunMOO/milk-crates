@verb match_utils:object_match_failed this none this rx
@program match_utils:object_match_failed
// $match_utils:object_match_failed(object, string[, ambigs]) => 0|1
// Tell-helper after :match / :match_object. Returns 1 if string does not match object (player is told), 0 if it does.
// ambigs, if a list, names the ambiguous choices. Always :tell (notify is compiled out). player:tell may E_VERBNF on a core with no :tell.
{match_result, string, ?ambigs = 0} = args;
nothing = `$nothing ! ANY => #-1';
failed = `$failed_match ! ANY => #-3';
ambiguous = `$ambiguous_match ! ANY => #-2';
tell = 0 && $perm_utils:controls(caller_perms(), player) ? "notify" | "tell";
if (index(string, "#") == 1 && $code_utils:toobj(string) != E_TYPE)
  if (!valid(match_result))
    player:(tell)(tostr("There is no \"", string, "\" that you can see."));
  endif
  return !valid(match_result);
elseif (match_result == nothing)
  player:(tell)("You must give the name of some object.");
else
  if (match_result == failed)
    player:(tell)(tostr("There is no \"", string, "\" that you can see."));
  elseif (match_result == ambiguous)
    if (typeof(ambigs) != LIST)
      player:(tell)(tostr("I don't know which \"", string, "\" you mean."));
      return 1;
    endif
    ambigs = $match_utils:match_list(string, ambigs);
    ambigs = $list_utils:map_property(ambigs, "name");
    if (length($list_utils:remove_duplicates(ambigs)) == 1 && $object_utils:isa(`player.location ! ANY => #-1', this.matching_room))
      player:(tell)(tostr("I don't know which \"", string, "\" you mean.  Try using \"first ", string, "\", \"second ", string, "\", etc."));
    else
      player:(tell)(tostr("I don't know which \"", string, "\" you mean: ", $string_utils:english_list(ambigs, "nothing", " or "), "."));
    endif
    return 1;
  else
    if (!valid(match_result))
      player:(tell)(tostr("The object you specified does not exist.  Seeing ghosts?"));
    else
      return 0;
    endif
  endif
endif
return 1;
.
