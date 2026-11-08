@verb pkg_tests:test_list this none none rxd
@program pkg_tests:test_list
got = `$pkg:list() ! ANY => 0';
if (typeof(got) != LIST || length(got) < 10)
  return "list => " + toliteral(typeof(got) == LIST ? length(got) | got);
endif
if (!("hello-utils" in got) || !("generic-utils" in got))
  return "catalog missing stock packs";
endif
return 1;
.
