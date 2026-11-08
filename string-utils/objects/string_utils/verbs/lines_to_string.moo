@verb string_utils:lines_to_string this none this rxd
@program string_utils:lines_to_string
// $string_utils:lines_to_string(@stuff) => STR
// Concatenate nested lists/strings into one string.
s = "";
for e in (args)
  if (typeof(e) == LIST)
    s = s + this:lines_to_string(@e);
  else
    s = s + tostr(e);
  endif
endfor
return s;
.
