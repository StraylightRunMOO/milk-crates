@verb string_tests:test_help this none none rxd
@program string_tests:test_help
code = `verb_code($string_utils, "explode") ! ANY => 0';
if (typeof(code) != LIST || !code)
  return "no verb_code";
endif
if (length(code[1]) < 2 || code[1][1..2] != "//" || !index(code[1], "$string_utils:explode"))
  return "explode help => " + toliteral(code[1]);
endif
cap = `verb_code($string_utils, "capitalize") ! ANY => 0';
if (typeof(cap) != LIST || !cap || cap[1][1..2] != "//" || !index(cap[1], "capitalize"))
  return "capitalize help => " + toliteral(typeof(cap) == LIST && cap ? cap[1] | cap);
endif
tr = `verb_code($string_utils, "trim") ! ANY => 0';
if (typeof(tr) != LIST || !tr || tr[1][1..2] != "//")
  return "trim help";
endif
hm = `$string_utils:help_msg() ! ANY => 0';
if (typeof(hm) != LIST || !hm)
  return "help_msg() => " + toliteral(hm);
endif
joined = "";
for line in (hm)
  joined = joined + tostr(line) + "
";
endfor
if (!index(joined, "explode"))
  return "help_msg() missing explode";
endif
vd = `$code_utils:verb_documentation($string_utils, "explode") ! ANY => 0';
if (typeof(vd) != LIST || !vd || !index(vd[1], "explode"))
  return "verb_documentation explode => " + toliteral(vd);
endif
return 1;
.
