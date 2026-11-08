@verb string_tests:test_values this none none rxd
@program string_tests:test_values
if ($string_utils:from_value({1, 2}) != "{1, 2}")
  return "from_value list";
endif
if ($string_utils:from_value("hi", 1) != "\"hi\"")
  return "from_value quote";
endif
fv = `$string_utils:from_value_suspended({1, 2}) ! ANY => 0';
if (fv != "{1, 2}")
  return "from_value_suspended => " + toliteral(fv);
endif
if ($string_utils:print("hi") != "\"hi\"")
  return "print";
endif
if ($string_utils:print_suspended(1) != "1")
  return "print_suspended";
endif
tv = $string_utils:to_value("123");
if (tv != {1, 123})
  return "to_value => " + toliteral(tv);
endif
pv = $string_utils:prefix_to_value("123 extra");
if (typeof(pv) != LIST || length(pv) < 2 || pv[2] != 123)
  return "prefix_to_value => " + toliteral(pv);
endif
ab = $string_utils:abbreviated_value({1, 2, 3}, 20);
if (typeof(ab) != STR || !index(ab, "{"))
  return "abbreviated_value => " + toliteral(ab);
endif
return 1;
.
