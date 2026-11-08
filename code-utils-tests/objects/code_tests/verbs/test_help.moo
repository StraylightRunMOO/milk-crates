@verb code_tests:test_help this none none rxd
@program code_tests:test_help
names = {"toint", "error_name", "commentify", "explain_verb_syntax", "full_prep", "prepositions", "show_object"};
for n in (names)
  code = `verb_code($code_utils, n) ! ANY => 0';
  if (typeof(code) != LIST || !code)
    return "no verb_code " + n;
  endif
  if (length(code[1]) < 2 || code[1][1..2] != "//" || !index(code[1], "$code_utils:" + n))
    return n + " help => " + toliteral(code[1]);
  endif
endfor
return 1;
.
