@verb string_utils:string_from_type type_from_string this none this rxd
@program string_utils:string_from_type type_from_string
// $string_utils:string_from_type(TYPE) / :type_from_string("STR") => STR|INT
// Name <-> typeof code. Unknown name => -1; unknown type => "".
if (verb == "type_from_string")
  s = uppercase(tostr(args[1]));
  if (s == "INT")
    return INT;
  elseif (s == "OBJ")
    return OBJ;
  else
    if (s == "STR")
      return STR;
    elseif (s == "ERR")
      return ERR;
    else
      if (s == "LIST")
        return LIST;
      elseif (s == "FLOAT")
        return FLOAT;
      else
        if (s == "MAP")
          return MAP;
        endif
      endif
    endif
  endif
  return -1;
endif
t = args[1];
if (t == INT)
  return "INT";
elseif (t == OBJ)
  return "OBJ";
else
  if (t == STR)
    return "STR";
  elseif (t == ERR)
    return "ERR";
  else
    if (t == LIST)
      return "LIST";
    elseif (t == FLOAT)
      return "FLOAT";
    else
      if (t == MAP)
        return "MAP";
      endif
    endif
  endif
endif
return "";
.
