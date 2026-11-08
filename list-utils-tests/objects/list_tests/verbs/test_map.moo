@verb list_tests:test_map this none none rxd
@program list_tests:test_map
if ($list_utils:map_arg(1, $list_utils, "first", {{1, 2}, {3, 4}}) != {1, 3})
  return "map_arg";
endif
if ($list_utils:map_arg($string_utils, "trim", {" a", "b "}) != {"a", "b"})
  return "map_arg no-n";
endif
if ($list_utils:map_args(1, $list_utils, "first", {{1, 2}, {3, 4}}) != {1, 3})
  return "map_args alias";
endif
if ($list_utils:map_builtin({1, 2}, "tostr") != {"1", "2"})
  return "map_builtin";
endif
if ($list_utils:map_property({$list_utils}, "name") != {$list_utils.name})
  return "map_property";
endif
if ($list_utils:map_prop({$list_utils}, "name") != {$list_utils.name})
  return "map_prop alias";
endif
if ($list_utils:map_verb({$list_utils}, "first", {9, 8, 7}) != {9})
  return "map_verb";
endif
return 1;
.
