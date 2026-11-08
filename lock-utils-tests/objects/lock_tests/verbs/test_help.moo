@verb lock_tests:test_help this none none rxd
@program lock_tests:test_help
names = {"parse_keyexp", "unparse_key", "eval_key", "canonicalize_spaces"};
for n in (names)
  code = `verb_code($lock_utils, n) ! ANY => 0';
  if (typeof(code) != LIST || !code)
    return "no verb_code " + n;
  endif
  if (length(code[1]) < 2 || code[1][1..2] != "//" || !index(code[1], "$lock_utils:" + n))
    return n + " help => " + toliteral(code[1]);
  endif
endfor
return 1;
.
