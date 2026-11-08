@verb code_tests:test_verb_documentation this none none rxd
@program code_tests:test_verb_documentation
// Leading // comments are help, without $no_one:eval.
d = `$code_utils:verb_documentation(this, "sample") ! ANY => 0';
if (d != {"sample help line", "second help line"})
  return "slash help => " + toliteral(d);
endif
return 1;
.
