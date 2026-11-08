@verb pkg:is_url this none none rxd
@program pkg:is_url
// $pkg:is_url
// True for https://, ssh://, file://, and scp-like git@host:path specs.
s = tostr(args[1]);
if (index(s, "://"))
  return 1;
endif
return index(s, "git@") == 1 && index(s, ":") ? 1 | 0;
.
