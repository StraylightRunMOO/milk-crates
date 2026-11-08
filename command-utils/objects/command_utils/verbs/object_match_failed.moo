@verb command_utils:object_match_failed this none this rxd
@program command_utils:object_match_failed
// $command_utils:object_match_failed(object, string [, allow_invalid]) => INT
// Prints a message if string does not match object.  Generally used after object is derived from a :match_object(string).
// If allow invalid is true, invalid objects > #0 are not considered a failure.
{match_result, string, ?allow_invalid = 0} = args;
nothing = `$nothing ! ANY => #-1';
failed = `$failed_match ! ANY => #-3';
ambiguous = `$ambiguous_match ! ANY => #-2';
tell = $perm_utils:controls(caller_perms(), player) ? "notify" | "tell";
if (index(string, "#") == 1 && $code_utils:toobj(string) != E_TYPE)
  // ...avoid the `I don't know which `#-2' you mean' message...
  if (allow_invalid && match_result > #0 && !valid(match_result))
    return 0;
  elseif (!valid(match_result))
    `player:(tell)(tostr(string, " does not exist.")) ! ANY => 0';
  endif
  return !valid(match_result);
elseif (match_result == nothing)
  `player:(tell)("You must give the name of some object.") ! ANY => 0';
else
  if (match_result == failed)
    `player:(tell)(tostr("I see no \"", string, "\" here.")) ! ANY => 0';
  elseif (match_result == ambiguous)
    `player:(tell)(tostr("I don't know which \"", string, "\" you mean.")) ! ANY => 0';
  else
    if (!allow_invalid && !valid(match_result))
      `player:(tell)(tostr(match_result, " does not exist.")) ! ANY => 0';
    else
      return 0;
    endif
  endif
endif
return 1;
.
