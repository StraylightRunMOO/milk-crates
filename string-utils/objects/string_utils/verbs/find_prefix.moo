@verb string_utils:find_prefix this none this rxd
@program string_utils:find_prefix
// $string_utils:find_prefix(prefix, string-list) => INT|OBJ
// 1-based index of a unique prefix match, 0 if none, $ambiguous_match if several.
{subject, choices} = args;
answer = 0;
for i in [1..length(choices)]
  if (index(choices[i], subject) == 1)
    if (answer == 0)
      answer = i;
    else
      answer = `$ambiguous_match ! ANY => #-2';
    endif
  endif
endfor
return answer;
.
