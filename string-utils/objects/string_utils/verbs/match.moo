@verb string_utils:match this none this rxd
@program string_utils:match
// $string_utils:match(string [, obj-list, prop-name]*) => OBJ
// Match string against property values (string or list of strings) on objects.
// Unique exact, else unique prefix. Else $ambiguous_match or $failed_match.
// Empty string => $nothing. Each obj-list may be one object or a list.
subject = args[1];
if (subject == "")
  return `$nothing ! ANY => #-1';
endif
no_exact_match = no_partial_match = 1;
for i in [1..length(args) / 2]
  prop_name = args[2 * i + 1];
  for object in (typeof(olist = args[2 * i]) == LIST ? olist | {olist})
    if (valid(object))
      if (typeof(str_list = `object.(prop_name) ! E_PERM, E_PROPNF => {}') != LIST)
        str_list = {str_list};
      endif
      if (subject in str_list)
        if (no_exact_match)
          no_exact_match = object;
        elseif (no_exact_match != object)
          return `$ambiguous_match ! ANY => #-2';
        endif
      else
        for string in (str_list)
          if (index(string, subject) != 1)
          elseif (no_partial_match)
            no_partial_match = object;
          else
            if (no_partial_match != object)
              no_partial_match = `$ambiguous_match ! ANY => #-2';
            endif
          endif
        endfor
      endif
    endif
  endfor
endfor
return no_exact_match && (no_partial_match && `$failed_match ! ANY => #-3');
.
