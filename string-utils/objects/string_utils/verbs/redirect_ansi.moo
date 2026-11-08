@verb string_utils:redirect_ansi this none this rx
@program string_utils:redirect_ansi
// $string_utils:redirect_ansi(verbname, @args) => ANY
// Dispatch verbname to $ansi_utils, or to this:(verbname + "(noansi)") if
// $ansi_utils is invalid. Not aliased as left/right/space — those verbs
// are defined on this object; first-match would steal :right and :space.
{vname, @vargs} = args;
if (valid(au = `$ansi_utils ! ANY => #-1'))
  return au:(vname)(@vargs);
endif
return this:(vname + "(noansi)")(@vargs);
.
