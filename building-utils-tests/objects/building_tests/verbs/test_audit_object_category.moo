@verb building_tests:test_audit_object_category this none none rxd
@program building_tests:test_audit_object_category
got = `$building_utils:audit_object_category($building_utils) ! ANY => 0';
if (typeof(got) != STR || length(got) != 1)
  return "utils => " + toliteral(got);
endif
if (is_player($building_utils) && got != "P")
  return "player flag";
endif
return 1;
.
