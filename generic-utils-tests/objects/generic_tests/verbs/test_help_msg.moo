@verb generic_tests:test_help_msg this none none rxd
@program generic_tests:test_help_msg
hm = `$generic_utils.help_msg ! ANY => 0';
if (typeof(hm) != LIST || !hm)
  return "help_msg => " + toliteral(hm);
endif
if (!index(tostr(hm[1]), "$generic_utils"))
  return "help_msg[1] => " + toliteral(hm[1]);
endif
if (!isa($generic_utils, $root_class))
  return "parent";
endif
got = `$generic_utils:help_msg() ! ANY => 0';
if (typeof(got) != LIST || !got)
  return "help_msg() => " + toliteral(got);
endif
joined = "";
for line in (got)
  joined = joined + tostr(line) + "
";
endfor
if (!index(joined, "help_msg"))
  return "help_msg() missing verb name => " + toliteral(got);
endif
if (!index(joined, "======================"))
  return "help_msg() missing separator";
endif
vd = `$code_utils:verb_documentation($generic_utils, "help_msg") ! ANY => 0';
if (typeof(vd) != LIST || !vd || !index(vd[1], "help_msg"))
  return "verb_documentation => " + toliteral(vd);
endif
return 1;
.
