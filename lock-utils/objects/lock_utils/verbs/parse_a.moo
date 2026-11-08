@verb lock_utils:parse_A this none this rxd
@program lock_utils:parse_A
// $lock_utils:parse_A() => LIST | OBJ | STR
// Parse an atom: (E), !A, ?object, or object. String on error.
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
    if (next in {"(", ")", "!", "&&", "||", "?"})
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
  elseif (token in {"&&", "||"})
    return "Missing expression before '" + token + "'";
  else
    if (token == "")
      return "Missing expression at end of key expression";
    else
      return this:match_object(token);
    endif
  endif
endif
.
