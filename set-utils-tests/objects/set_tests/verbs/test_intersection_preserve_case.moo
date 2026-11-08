@verb set_tests:test_intersection_preserve_case this none none rxd
@program set_tests:test_intersection_preserve_case
r = $set_utils:intersection_preserve_case({"A", "b"}, {"a", "B", "c"});
if (r != {"A", "b"})
  return "preserve => " + toliteral(r);
endif
return 1;
.
