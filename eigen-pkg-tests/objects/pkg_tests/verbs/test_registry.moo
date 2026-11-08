@verb pkg_tests:test_registry this none none rxd
@program pkg_tests:test_registry
reg = `$pkg.registry ! ANY => 0';
if (typeof(reg) != STR || !index(reg, "milk-crates"))
  return "registry => " + toliteral(reg);
endif
if (`$pkg:is_url(reg) ! ANY => 0' != 1)
  return "registry is_url";
endif
if (`$pkg:name_from_spec(reg) ! ANY => ""' != "milk-crates")
  return "name_from_spec registry";
endif
return 1;
.
