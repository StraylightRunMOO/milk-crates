@verb string_utils:prefix_to_value this none this rxd
@program string_utils:prefix_to_value
// $string_utils:prefix_to_value(string) => LIST
// Parse a leading MOO value. {rest, value} or {0, error_message}.
alen = length(args[1]);
slen = length(string = this:triml(args[1]));
if (!string)
  return {0, "empty string"};
elseif (w = index("{[\"", string[1]))
  result = this:({"_tolist", "_tomap", "_unquote"}[w])(string[2..slen]);
  if (typeof(result[1]) != INT)
    return result;
  elseif (result[1] == 0)
    return {0, "missing } or \""};
  else
    return {0, result[2], alen - result[1] + 1};
  endif
else
  thing = string[1..tlen = index(string + " ", " ") - 1];
  if (typeof(s = this:_toscalar(thing)) != STR)
    return {string[tlen + 1..slen], s};
  else
    return {0, s, alen - slen + 1};
  endif
endif
.
