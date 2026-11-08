@verb string_utils:literal_object this none this rxd
@program string_utils:literal_object
// $string_utils:literal_object(string) => OBJ
// #obj, $sysobj.prop, ~player, *mail-recipient. Else $failed_match; "" => $nothing.
string = args[1];
if (!string)
  return `$nothing ! ANY => #-1';
elseif (string[1] == "#" && E_TYPE != (object = $code_utils:toobj(string)))
  return object;
else
  if (string[1] == "~")
    return this:match_player(string[2..$], #0);
  elseif (string[1] == "*" && length(string) > 1)
    return $mail_agent:match_recipient(string);
  else
    if (string[1] == "$")
      string[1..1] = "";
      object = #0;
      while (pn = string[1..(dot = index(string, ".")) ? dot - 1 | $])
        if (!$object_utils:has_property(object, pn) || typeof(object = object.(pn)) != OBJ)
          // Try to match a map now.
          object = $code_utils:parse_sysobj_map(args[1]);
          if (object == E_PROPNF)
            return `$failed_match ! ANY => #-3';
          else
            break;
          endif
        endif
        string = string[length(pn) + 2..$];
      endwhile
      if (object == #0 || typeof(object) == ERR)
        return `$failed_match ! ANY => #-3';
      else
        return object;
      endif
    else
      return `$failed_match ! ANY => #-3';
    endif
  endif
endif
.
