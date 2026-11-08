@verb lock_tests:test_canonicalize_spaces this none none rxd
@program lock_tests:test_canonicalize_spaces
got = `$lock_utils:canonicalize_spaces("a  b   c") ! ANY => 0';
if (got != "a b c")
  return "a  b   c => " + toliteral(got);
endif
return 1;
.
