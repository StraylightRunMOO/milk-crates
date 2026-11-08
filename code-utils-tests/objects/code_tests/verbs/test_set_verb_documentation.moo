@verb code_tests:test_set_verb_documentation this none none rxd
@program code_tests:test_set_verb_documentation
// set_verb_documentation replaces the // block and round-trips.
r = `$code_utils:set_verb_documentation(this, "sample", {"alpha", "beta"}) ! ANY => 0';
if (r != 1)
  return "set => " + toliteral(r);
endif
d = `$code_utils:verb_documentation(this, "sample") ! ANY => 0';
if (d != {"alpha", "beta"})
  return "after set => " + toliteral(d);
endif
code = `verb_code(this, "sample") ! ANY => {}';
if (!code || code[1][1..2] != "//")
  return "verb_code[1] => " + toliteral(code ? code[1] | 0);
endif
got = `$code_tests:sample() ! ANY => 0';
if (got != 42)
  return "body clobbered => " + toliteral(got);
endif
`$code_utils:set_verb_documentation(this, "sample", {"sample help line", "second help line"}) ! ANY => 0';
return 1;
.
