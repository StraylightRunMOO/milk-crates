@verb gender_tests:test_set this none none rxd
@program gender_tests:test_set
r = 1;
obj = `create($root_class) ! ANY => 0';
if (typeof(obj) != OBJ || !valid(obj))
  obj = `create(#-1) ! ANY => 0';
endif
if (typeof(obj) != OBJ || !valid(obj))
  return "no object";
endif
`$gender_utils:add(obj) ! ANY => 0';
if (`typeof(obj.ps) ! ANY => 0' != STR)
  `recycle(obj) ! ANY => 0';
  return "add failed";
endif
got = `$gender_utils:set(obj, "female") ! ANY => 0';
if (got != "female")
  r = "set female => " + toliteral(got);
endif
if (r == 1)
  p = `$gender_utils:get_pronoun("s", obj) ! ANY => 0';
  if (p != "she")
    r = "pronoun after set => " + toliteral(p);
  endif
endif
`recycle(obj) ! ANY => 0';
return r;
.
