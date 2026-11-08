@verb object_tests:test_help this none none rxd
@program object_tests:test_help
code = `verb_code($object_utils, "descendants") ! ANY => 0';
if (typeof(code) != LIST || !code)
  return "no verb_code descendants";
endif
if (length(code[1]) < 2 || code[1][1..2] != "//" || !index(code[1], "$object_utils:descendants"))
  return "descendants help => " + toliteral(code[1]);
endif
isa_code = `verb_code($object_utils, "isa") ! ANY => 0';
if (typeof(isa_code) != LIST || !isa_code || length(isa_code[1]) < 2 || isa_code[1][1..2] != "//" || !index(isa_code[1], "$object_utils:isa"))
  return "isa help => " + toliteral(typeof(isa_code) == LIST && isa_code ? isa_code[1] | isa_code);
endif
anc = `verb_code($object_utils, "ancestors") ! ANY => 0';
if (typeof(anc) != LIST || !anc || length(anc[1]) < 2 || anc[1][1..2] != "//" || !index(anc[1], "$object_utils:ancestors"))
  return "ancestors help => " + toliteral(typeof(anc) == LIST && anc ? anc[1] | anc);
endif
return 1;
.
