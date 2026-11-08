@verb string_utils:pronoun_quote this none this rxd
@program string_utils:pronoun_quote
// $string_utils:pronoun_quote(string|list|{key,string} pairs) => STR|LIST
// Double % so pronoun_sub will leave the text literal. "--%Spam%--" => "--%%Spam%%--".
if (typeof(what = args[1]) == STR)
  return strsub(what, "%", "%%");
else
  ret = {};
  for w in (what)
    if (typeof(w) == LIST)
      ret = listappend(ret, listset(w, strsub(w[2], "%", "%%"), 2));
    else
      ret = listappend(ret, strsub(w, "%", "%%"));
    endif
  endfor
  return ret;
endif
.
