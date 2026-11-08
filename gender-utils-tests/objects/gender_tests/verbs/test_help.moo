@verb gender_tests:test_help this none none rxd
@program gender_tests:test_help
names = {"set", "get_pronoun", "get_conjugation", "add"};
for n in (names)
  code = `verb_code($gender_utils, n) ! ANY => 0';
  if (typeof(code) != LIST || !code)
    return "no verb_code " + n;
  endif
  if (length(code[1]) < 2 || code[1][1..2] != "//" || !index(code[1], "$gender_utils:" + n))
    return n + " help => " + toliteral(code[1]);
  endif
endfor
return 1;
.
