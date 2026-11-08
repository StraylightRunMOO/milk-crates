@verb list_tests:test_append_compress this none none rxd
@program list_tests:test_append_compress
if ($list_utils:append({1, 2}, {3}, {4, 5}) != {1, 2, 3, 4, 5})
  return "append";
endif
if ($list_utils:append() != {})
  return "append none";
endif
if ($list_utils:compress({1, 1, 2, 2, 2, 3, 1}) != {1, 2, 3, 1})
  return "compress";
endif
if ($list_utils:compress({}) != {})
  return "compress empty";
endif
return 1;
.
