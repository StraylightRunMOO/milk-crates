@verb pkg_tests:test_is_url this none none rxd
@program pkg_tests:test_is_url
if (`$pkg:is_url("https://github.com/you/moo-combat") ! ANY => 0' != 1)
  return "https";
endif
if (`$pkg:is_url("git@host:path") ! ANY => 0' != 1)
  return "scp";
endif
if (`$pkg:is_url("hello-utils") ! ANY => 1')
  return "bare name should be false";
endif
return 1;
.
