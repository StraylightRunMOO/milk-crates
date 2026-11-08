@verb math_tests:test_help this none none rxd
@program math_tests:test_help
if (`$math_utils ! ANY => #-1' != `$trig_utils ! ANY => #-2')
  return "cored: math_utils=" + toliteral(`$math_utils ! ANY => #-1') + " trig_utils=" + toliteral(`$trig_utils ! ANY => #-2');
endif
code = `verb_code($math_utils, "factorial") ! ANY => 0';
if (typeof(code) != LIST || !code)
  return "no verb_code";
endif
if (length(code[1]) < 2 || code[1][1..2] != "//" || !index(code[1], "$math_utils:factorial"))
  return "factorial help => " + toliteral(code[1]);
endif
a = `verb_code($math_utils, "AND") ! ANY => 0';
if (typeof(a) != LIST || !a || a[1][1..2] != "//" || !index(a[1], "$math_utils:AND"))
  return "AND help => " + toliteral(typeof(a) == LIST && a ? a[1] | a);
endif
n = `verb_code($math_utils, "NOT") ! ANY => 0';
if (typeof(n) != LIST || !n || n[1][1..2] != "//" || !index(n[1], "$math_utils:NOT"))
  return "NOT help => " + toliteral(typeof(n) == LIST && n ? n[1] | n);
endif
p = `verb_code($math_utils, "to_percent") ! ANY => 0';
if (typeof(p) != LIST || !p || p[1][1..2] != "//" || !index(p[1], "$math_utils:to_percent"))
  return "to_percent help => " + toliteral(typeof(p) == LIST && p ? p[1] | p);
endif
s = `verb_code($math_utils, "sin") ! ANY => 0';
if (typeof(s) != LIST || !s || s[1][1..2] != "//" || !index(s[1], "$math_utils:sin"))
  return "sin help => " + toliteral(typeof(s) == LIST && s ? s[1] | s);
endif
return 1;
.
