@verb string_tests:test_hash this none none rxd
@program string_tests:test_hash
h = $string_utils:strhash("x");
if (typeof(h) != STR || length(h) != 16)
  return "strhash type => " + toliteral(h);
endif
if ($string_utils:strhash("x") != h)
  return "strhash stable";
endif
if ($string_utils:strhash("y") == h)
  return "strhash distinct";
endif
return 1;
.
