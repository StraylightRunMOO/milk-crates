@verb pkg_tests:test_name_from_spec this none none rxd
@program pkg_tests:test_name_from_spec
got = `$pkg:name_from_spec("https://github.com/you/moo-combat.git") ! ANY => ""';
if (got != "moo-combat")
  return "url => " + toliteral(got);
endif
return 1;
.
