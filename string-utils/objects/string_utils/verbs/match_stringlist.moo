@verb string_utils:match_stringlist match_string_list this none this rx
@program string_utils:match_stringlist match_string_list
// $string_utils:match_stringlist/match_string_list(string, stringlist) => INT|OBJ
// Unique exact index, else unique prefix index, else $ambiguous_match / $failed_match.
// Empty string or empty list => $nothing.
{subject, stringlist} = args;
// Copied from Puff (#1449):match_stringlist Tue Oct 19 08:18:13 1993 PDT
if (subject == "" || length(stringlist) < 1)
  return `$nothing ! ANY => #-1';
endif
matches = {};
// First check for exact matches.
for i in [1..length(stringlist)]
  if (subject == stringlist[i])
    matches = {@matches, i};
  endif
endfor
// Now return a match, or $ambiguous, or check for partial matches.
if (length(matches) == 1)
  return matches[1];
elseif (length(matches) > 1)
  return `$ambiguous_match ! ANY => #-2';
else
  if (length(matches) == 0)
    // Checking for partial matches is almost identical to checking for exact matches, but we use index(list[i], target) instead of list[i] == target to see if they match.
    for i in [1..length(stringlist)]
      if (index(stringlist[i], subject) == 1)
        matches = {@matches, i};
      endif
    endfor
    if (length(matches) == 1)
      return matches[1];
    elseif (length(matches) > 1)
      return `$ambiguous_match ! ANY => #-2';
    else
      if (length(matches) == 0)
        return `$failed_match ! ANY => #-3';
      endif
    endif
  endif
endif
.
