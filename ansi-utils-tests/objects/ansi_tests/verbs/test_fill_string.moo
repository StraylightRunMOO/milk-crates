@verb ansi_tests:test_fill_string this none none rxd
@program ansi_tests:test_fill_string
got = `$ansi_utils:fill_string("hello world foo", 8) ! ANY => 0';
if (typeof(got) != LIST || !got)
  return "fill_string => " + toliteral(got);
endif
if (!index(got[1], "hello"))
  return "fill first => " + toliteral(got);
endif
return 1;
.
