@verb pkg_tests:test_help this none none rxd
@program pkg_tests:test_help
r = 1;
vs = `verbs($pkg) ! ANY => {}';
for spec in (vs)
  n = explode(spec)[1];
  code = `verb_code($pkg, n) ! ANY => 0';
  if (typeof(code) != LIST || !code)
    r = "no verb_code " + n;
    break;
  elseif (length(code[1]) < 2 || code[1][1..2] != "//" || !index(code[1], "$pkg:"))
    r = n + " help => " + toliteral(code[1]);
    break;
  endif
endfor
return r;
.
