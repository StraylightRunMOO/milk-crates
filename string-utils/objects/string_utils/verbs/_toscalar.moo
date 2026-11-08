@verb string_utils:_toscalar this none this rxd
@program string_utils:_toscalar
// $string_utils:_toscalar(string) => ANY
// Auxiliary for :to_value. Number/object/error/true/false, else an error string.
thing = args[1];
if (!thing)
  return "missing value";
elseif (match(thing, "^#?[-+]?[0-9]+ *$"))
  return thing[1] == "#" ? toobj(thing) | toint(thing);
else
  if (match(thing, "^[-+]?%([0-9]+%.[0-9]*%|[0-9]*%.[0-9]+%)%(e[-+]?[0-9]+%)? *$"))
    // matches 2. .2 3.2 3.2e3 .2e-3 3.e3
    return `tofloat(thing) ! E_INVARG => tostr("Bad floating point value: ", thing)';
  elseif (match(thing, "^[-+]?[0-9]+e[-+]?[0-9]+ *$"))
    // matches 345e4. No decimal, but has an e so still a float
    return `tofloat(thing) ! E_INVARG => tostr("Bad floating point value: ", thing)';
  else
    if (thing == "true")
      return true;
    elseif (thing == "false")
      return false;
    else
      if (thing[1] == "E")
        return (e = $code_utils:toerr(thing)) ? tostr("unknown error code `", thing, "'") | e;
      elseif (thing[1] == "#")
        return tostr("bogus objectid `", thing, "'");
      else
        return tostr("`", thing[1], "' unexpected");
      endif
    endif
  endif
endif
.
