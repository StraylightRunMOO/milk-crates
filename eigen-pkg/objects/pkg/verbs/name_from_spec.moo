@verb pkg:name_from_spec this none none rxd
@program pkg:name_from_spec
// $pkg:name_from_spec
// Last path component of a URL or sandbox path, stripped of .git.
s = tostr(args[1]);
while (s && s[$] == "/")
  s = s[1..$ - 1];
endwhile
if (length(s) >= 4 && s[$ - 3..$] == ".git")
  s = s[1..$ - 4];
endif
slash = rindex(s, "/");
if (slash)
  s = s[slash + 1..$];
endif
colon = rindex(s, ":");
if (colon)
  s = s[colon + 1..$];
endif
out = "";
for i in [1..length(s)]
  c = s[i];
  if (index("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789._-", c))
    out = out + c;
  elseif (out && out[$] != "-")
    out = out + "-";
  endif
endfor
while (out && out[$] == "-")
  out = out[1..$ - 1];
endwhile
return out ? out | "pack";
.
