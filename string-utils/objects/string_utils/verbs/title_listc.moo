@verb string_utils:title_list*c list_title*c this none this rxd
@program string_utils:title_list*c list_title*c
// $string_utils:title_list/title_listc(obj-list [, english_list args...]) => STR
// English list of :title()s. title_listc uses :titlec() for the first item.
titles = $list_utils:map_verb(args[1], "title");
if (verb[length(verb)] == "c")
  if (titles)
    titles[1] = args[1][1]:titlec();
  elseif (length(args) > 1)
    args[2] = $string_utils:capitalize(args[2]);
  else
    args = listappend(args, "Nothing");
  endif
endif
return $string_utils:english_list(titles, @args[2..$]);
.
