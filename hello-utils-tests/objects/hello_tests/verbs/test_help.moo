@verb hello_tests:test_help this none none rxd
@program hello_tests:test_help
code = `verb_code($hello, "greet") ! ANY => 0';
if (typeof(code) != LIST || !code)
  return "no verb_code greet";
endif
if (length(code[1]) < 2 || code[1][1..2] != "//" || !index(code[1], "$hello:greet"))
  return "greet help => " + toliteral(code[1]);
endif
return 1;
.
