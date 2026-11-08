@verb pkg_tests:test_safe_subdir this none none rxd
@program pkg_tests:test_safe_subdir
if (`$pkg:safe_subdir("hello-utils") ! ANY => 0' != "hello-utils")
  return "bare";
endif
if (`$pkg:safe_subdir("crates/hello-utils/") ! ANY => 0' != "crates/hello-utils")
  return "nested";
endif
if (`$pkg:safe_subdir("../escape") ! ANY => 1')
  return "dotdot";
endif
if (`$pkg:safe_subdir("/abs") ! ANY => 1')
  return "abs";
endif
if (`$pkg:safe_subdir("foo/../bar") ! ANY => 1')
  return "mid-dotdot";
endif
return 1;
.
