@verb seq_tests:test_help this none none rxd
@program seq_tests:test_help
code = `verb_code($seq_utils, "union") ! ANY => 0';
if (typeof(code) != LIST || !code)
  return "no verb_code";
endif
if (length(code[1]) < 2 || code[1][1..2] != "//" || !index(code[1], "$seq_utils:union"))
  return "union help => " + toliteral(code[1]);
endif
return 1;
.
