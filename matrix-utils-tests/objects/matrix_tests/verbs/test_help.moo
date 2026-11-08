@verb matrix_tests:test_help this none none rxd
@program matrix_tests:test_help
names = {"identity", "null", "matrix_add", "vector_add", "transpose", "determinant", "dot_prod", "is_square"};
for n in (names)
  code = `verb_code($matrix_utils, n) ! ANY => 0';
  if (typeof(code) != LIST || !code)
    return "no verb_code " + n;
  endif
  if (length(code[1]) < 2 || code[1][1..2] != "//" || !index(code[1], "$matrix_utils:" + n))
    return n + " help => " + toliteral(code[1]);
  endif
endfor
return 1;
.
