@verb list_tests:test_random this none none rxd
@program list_tests:test_random
if ($list_utils:random_item({42}) != 42)
  return "random_item singleton";
endif
if ($list_utils:random_element({42}) != 42)
  return "random_element alias";
endif
if ($list_utils:random_item({}) != E_RANGE)
  return "random_item empty";
endif
p = $list_utils:randomly_permute({1, 2, 3});
if (typeof(p) != LIST || length(p) != 3 || !(1 in p) || !(2 in p) || !(3 in p))
  return "randomly_permute => " + toliteral(p);
endif
p = $list_utils:randomly_permute_suspended({1, 2, 3});
if (typeof(p) != LIST || length(p) != 3 || !(1 in p) || !(2 in p) || !(3 in p))
  return "randomly_permute_suspended => " + toliteral(p);
endif
return 1;
.
