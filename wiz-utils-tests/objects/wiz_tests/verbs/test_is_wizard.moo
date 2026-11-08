@verb wiz_tests:test_is_wizard this none none rxd
@program wiz_tests:test_is_wizard
got = `$wiz_utils:is_wizard(player) ! ANY => 0';
if (got != 1)
  return "player => " + toliteral(got);
endif
obj = `create($root_class) ! ANY => 0';
if (typeof(obj) == OBJ && valid(obj))
  got = `$wiz_utils:is_wizard(obj) ! ANY => 1';
  `recycle(obj) ! ANY => 0';
  if (got)
    return "mortal => " + toliteral(got);
  endif
endif
return 1;
.
