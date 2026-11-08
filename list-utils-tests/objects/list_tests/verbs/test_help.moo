@verb list_tests:test_help this none none rxd
@program list_tests:test_help
code = `verb_code($list_utils, "flatten") ! ANY => 0';
if (typeof(code) != LIST || !code)
  return "no verb_code";
endif
if (length(code[1]) < 2 || code[1][1..2] != "//" || !index(code[1], "$list_utils:flatten"))
  return "flatten help => " + toliteral(code[1]);
endif
return 1;
.
