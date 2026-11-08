@verb pkg:safe_subdir this none none rxd
@program pkg:safe_subdir
// $pkg:safe_subdir(s) => STR or 0
// Relative crate path with no empty, ., or .. components.
s = tostr(args[1]);
while (s && s[$] == "/")
  s = s[1..$ - 1];
endwhile
if (!s || s[1] == "/")
  return 0;
endif
rest = s;
while (rest)
  slash = index(rest, "/");
  part = slash ? rest[1..slash - 1] | rest;
  rest = slash ? rest[slash + 1..$] | "";
  if (part == "" || part == "." || part == "..")
    return 0;
  endif
endwhile
return s;
.
