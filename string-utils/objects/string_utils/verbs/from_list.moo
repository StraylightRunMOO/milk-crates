@verb string_utils:from_list join this none this rxd
@program string_utils:from_list join
// $string_utils:from_list/join(list [, separator]) => STR
// Join tostr() of each element. Separator defaults to empty.
{thelist, ?separator = ""} = args;
if (separator == "")
  return tostr(@thelist);
endif
out = {};
for elt in (thelist)
  out = {@out, tostr(elt)};
endfor
return implode(out, separator);
.
