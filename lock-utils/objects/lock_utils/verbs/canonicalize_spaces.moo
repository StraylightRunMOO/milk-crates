@verb lock_utils:canonicalize_spaces this none this rxd
@program lock_utils:canonicalize_spaces
// $lock_utils:canonicalize_spaces(string) => STR
// Collapse runs of spaces to a single space. ToastStunt while/strsub loop (does not trim ends).
name = args[1];
while (index(name, "  "))
  name = strsub(name, "  ", " ");
endwhile
return name;
.
