@verb building_tests:test_parse_names this none none rxd
@program building_tests:test_parse_names
got = `$building_utils:parse_names("north:n, North") ! ANY => 0';
if (typeof(got) != LIST || length(got) != 2)
  return "colon => " + toliteral(got);
endif
if (got[1] != "north")
  return "colon name => " + toliteral(got[1]);
endif
if (got[2] != {"n", "North"})
  return "colon aliases => " + toliteral(got[2]);
endif
got = `$building_utils:parse_names("foo, bar,baz") ! ANY => 0';
if (typeof(got) != LIST || got[1] != "foo")
  return "comma name => " + toliteral(got);
endif
if (got[2] != {"foo", "bar", "baz"})
  return "comma aliases => " + toliteral(got[2]);
endif
return 1;
.
