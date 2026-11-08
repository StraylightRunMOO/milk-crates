@verb string_tests:test_pluralize this none none rxd
@program string_tests:test_pluralize
if ($string_utils:pluralize("box") != "boxes")
  return "box";
endif
if ($string_utils:pluralize("cat") != "cats")
  return "cat";
endif
if ($string_utils:pluralize("city") != "cities")
  return "city";
endif
if ($string_utils:pluralize("box", 1) != "box")
  return "count 1";
endif
return 1;
.
