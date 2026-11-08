@verb string_utils:match_suspended this none this rxd
@program string_utils:match_suspended
// $string_utils:match_suspended(string [, obj-list, prop-name]*) => OBJ
// Like :match but suspends as needed for large obj-lists.
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
    $command_utils:suspend_if_needed(5);
  endfor
endfor
return no_exact_match && (no_partial_match && `$failed_match ! ANY => #-3');
.
