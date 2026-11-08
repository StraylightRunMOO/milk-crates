@verb code_utils:dump_preamble this none this rxd
@program code_utils:dump_preamble
// $code_utils:dump_preamble(object) => STR
// Produces the @create command necessary to dump this object.
dobj = args[1];
parent = parent(dobj);
pstring = tostr(parent);
for p in (properties(#0))
  if (#0.(p) == parent)
    pstring = "$" + p;
  endif
endfor
return tostr("@create ", pstring, " named ", dobj.name, ":", $string_utils:from_list(dobj.aliases, ","));
.
