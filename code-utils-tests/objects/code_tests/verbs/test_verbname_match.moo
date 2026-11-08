@verb code_tests:test_verbname_match this none none rxd
@program code_tests:test_verbname_match
if (!`$code_utils:verbname_match("foo bar", "foo") ! ANY => 0')
  return "foo bar / foo";
endif
if (!`$code_utils:verbname_match("foo bar", "bar") ! ANY => 0')
  return "foo bar / bar";
endif
if (!`$code_utils:verbname_match("foo", "foo") ! ANY => 0')
  return "foo / foo";
endif
if (`$code_utils:verbname_match("foo", "bar") ! ANY => 1')
  return "foo / bar matched";
endif
if (!`$code_utils:verbname_match("foo*", "foo") ! ANY => 0')
  return "foo* / foo";
endif
if (!`$code_utils:verbname_match("foo*", "foobar") ! ANY => 0')
  return "foo* / foobar";
endif
return 1;
.
