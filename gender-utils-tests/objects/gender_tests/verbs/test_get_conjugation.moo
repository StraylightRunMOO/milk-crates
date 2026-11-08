@verb gender_tests:test_get_conjugation this none none rxd
@program gender_tests:test_get_conjugation
r = 1;
obj = `create($root_class) ! ANY => 0';
if (typeof(obj) != OBJ || !valid(obj))
  obj = `create(#-1) ! ANY => 0';
endif
if (typeof(obj) == OBJ && valid(obj))
  got = `$gender_utils:get_conjugation("is/are", obj) ! ANY => 0';
  if (got != "is")
    r = "is/are singular => " + toliteral(got);
  endif
  `recycle(obj) ! ANY => 0';
else
  got = `$gender_utils:get_conjugation("is/are", $gender_utils) ! ANY => 0';
  if (got != "is")
    r = "is/are fallback => " + toliteral(got);
  endif
endif
return r;
.
