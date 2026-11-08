@verb string_utils:_unquote this none this rxd
@program string_utils:_unquote
// $string_utils:_unquote(string) => LIST
// Auxiliary for :to_value. {rest, unquoted} or {0, unquoted} if no closing quote.
rest = args[1];
result = "";
while (m = match(rest, "\\.?%|\""))
  // Find the next special character
  if (rest[pos = m[1]] == "\"")
    return {rest[pos + 1..$], result + rest[1..pos - 1]};
  endif
  result = result + rest[1..pos - 1] + rest[pos + 1..m[2]];
  rest = rest[m[2] + 1..$];
endwhile
return {0, result + rest};
.
