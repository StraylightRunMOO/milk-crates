@verb string_tests:test_explode this none none rxd
@program string_tests:test_explode
if ($string_utils:explode("a b c") != {"a", "b", "c"})
  return "explode a b c";
endif
if ($string_utils:split("a b c") != {"a", "b", "c"})
  return "split alias";
endif
if ($string_utils:explode("a,b,c", ",") != {"a", "b", "c"})
  return "explode comma";
endif
return 1;
.
