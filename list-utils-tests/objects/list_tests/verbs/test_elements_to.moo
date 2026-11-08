@verb list_tests:test_elements_to this none none rxd
@program list_tests:test_elements_to
if ($list_utils:elements_tostr({1, 2}) != {"1", "2"})
  return "tostr";
endif
if ($list_utils:elements_toint({"4", "5"}) != {4, 5})
  return "toint";
endif
o = $list_utils:elements_toobj({1});
if (typeof(o) != LIST || typeof(o[1]) != OBJ)
  return "toobj => " + toliteral(o);
endif
if ($list_utils:elements_toliteral({1}) != {"1"})
  return "toliteral";
endif
return 1;
.
