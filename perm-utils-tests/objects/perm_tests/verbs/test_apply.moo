@verb perm_tests:test_apply this none none rxd
@program perm_tests:test_apply
got = `$perm_utils:apply("rw", "+x") ! ANY => 0';
if (typeof(got) != STR || !index(got, "x"))
  return "rw+x => " + toliteral(got);
endif
got = `$perm_utils:apply("rwx", "-w") ! ANY => 0';
if (typeof(got) != STR || index(got, "w"))
  return "rwx-w => " + toliteral(got);
endif
got = `$perm_utils:apply("rwx", "!w") ! ANY => 0';
if (typeof(got) != STR || index(got, "w"))
  return "rwx!w => " + toliteral(got);
endif
return 1;
.
