@verb string_utils:to_value this none this rxd
@program string_utils:to_value
// $string_utils:to_value(string) => LIST
// Parse a MOO value. {1, value} on success, {0, error_message} on failure.
string = this:triml(args[1]);
if (string[1] == "[" || string[$] == "]")
  result = this:_tomap(string[1] == "[" ? string[2..$] | string);
  if (typeof(result[2]) != MAP)
    return {0, result[2]};
  else
    return {1, result[2]};
  endif
else
  result = this:_tolist(string = args[1] + "}");
  if (result[1] && result[1] != $string_utils:space(result[1]))
    return {0, tostr("after char ", length(string) - result[1], ":  ", result[2])};
  elseif (typeof(result[1]) == INT)
    return {0, "missing } or \""};
  else
    if (length(result[2]) > 1)
      return {0, "comma unexpected."};
    elseif (result[2])
      return {1, typeof(result[2]) == LIST ? result[2][1] | result[2]};
    else
      return {0, "missing expression"};
    endif
  endif
endif
.
