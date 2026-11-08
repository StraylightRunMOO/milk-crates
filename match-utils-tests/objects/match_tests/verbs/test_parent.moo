@verb match_tests:test_parent this none none rxd
@program match_tests:test_parent
if (!valid(`$match_utils ! ANY => #-1'))
  return "$match_utils missing";
endif
root = `$root_class ! ANY => #-1';
if (valid(root) && !isa($match_utils, root))
  return "not under $root_class";
endif
return 1;
.
