@verb building_tests:test_size_string this none none rxd
@program building_tests:test_size_string
if (`$building_utils:size_string(0) ! ANY => 0' != " ???")
  return "zero => " + toliteral(`$building_utils:size_string(0) ! ANY => 0');
endif
if (`$building_utils:size_string(500) ! ANY => 0' != " <1K")
  return "bytes => " + toliteral(`$building_utils:size_string(500) ! ANY => 0');
endif
k = `$building_utils:size_string(1500) ! ANY => 0';
if (typeof(k) != STR || !index(k, "K"))
  return "k => " + toliteral(k);
endif
m = `$building_utils:size_string(2000000) ! ANY => 0';
if (typeof(m) != STR || !index(m, "M"))
  return "m => " + toliteral(m);
endif
return 1;
.
