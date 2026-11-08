@verb lock_utils:parse_A_new this none this rxd
@program lock_utils:parse_A_new
// $lock_utils:parse_A_new() => LIST | OBJ | STR
// Like parse_A, plus ":" verb and "." property atoms.
token = this:scan_token();
if (token == "(")
  exp = this:parse_E();
  if (typeof(exp) != STR && this:scan_token() != ")")
    return "Missing ')'";
  else
    return exp;
  endif
elseif (token == "!")
  exp = this:parse_A();
  if (typeof(exp) == STR)
    return exp;
  else
    return {"!", exp};
  endif
else
  if (token == "?")
    next = this:scan_token();
    if (next in {":", ".", "(", ")", "!", "&&", "||", "?"})
      return "Missing object-name before '" + token + "'";
    elseif (next == "")
      return "Missing object-name at end of key expression";
    else
      what = this:match_object(next);
      if (typeof(what) == OBJ)
        return {"?", this:match_object(next)};
      else
        return what;
      endif
    endif
  elseif (token in {":", "."})
    next = this:scan_token();
    if (next in {":", ".", "(", ")", "!", "&&", "||", "?"})
      return "Missing verb-or-property-name before '" + token + "'";
    elseif (next == "")
      return "Missing verb-or-property-name at end of key expression";
    else
      if (typeof(next) != STR)
        return "Non-string verb-or-property-name at end of key expression";
      else
        return {token, next};
      endif
    endif
  else
    if (token in {"&&", "||"})
      return "Missing expression before '" + token + "'";
    elseif (token == "")
      return "Missing expression at end of key expression";
    else
      return this:match_object(token);
    endif
  endif
endif
.
