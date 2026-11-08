@verb building_tests:test_help this none none rxd
@program building_tests:test_help
names = {"parse_names", "set_names", "make_exit", "recreate", "size_string"};
for n in (names)
  code = `verb_code($building_utils, n) ! ANY => 0';
  if (typeof(code) != LIST || !code)
    return "no verb_code " + n;
  endif
  if (length(code[1]) < 2 || code[1][1..2] != "//" || !index(code[1], "$building_utils:" + n))
    return n + " help => " + toliteral(code[1]);
  endif
endfor
return 1;
.
