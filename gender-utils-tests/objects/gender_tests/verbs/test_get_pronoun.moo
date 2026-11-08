@verb gender_tests:test_get_pronoun this none none rxd
@program gender_tests:test_get_pronoun
r = 1;
obj = `create($root_class) ! ANY => 0';
if (typeof(obj) != OBJ || !valid(obj))
  obj = `create(#-1) ! ANY => 0';
endif
if (typeof(obj) == OBJ && valid(obj))
  `add_property(obj, "ps", "he", {obj.owner, "rc"}) ! ANY => 0';
  got = `$gender_utils:get_pronoun("s", obj) ! ANY => 0';
  if (got != "he")
    r = "ps he => " + toliteral(got);
  endif
  `recycle(obj) ! ANY => 0';
endif
if (r == 1)
  gnum = `"male" in $gender_utils.genders ! ANY => 0';
  if (gnum != 2)
    r = "male gnum => " + toliteral(gnum);
  elseif (`$gender_utils.ps[gnum] ! ANY => 0' != "he")
    r = "ps[male] => " + toliteral(`$gender_utils.ps[gnum] ! ANY => 0');
  else
    obj = `create($root_class) ! ANY => 0';
    if (typeof(obj) != OBJ || !valid(obj))
      obj = `create(#-1) ! ANY => 0';
    endif
    if (typeof(obj) == OBJ && valid(obj))
      `add_property(obj, "gender", "male", {obj.owner, "rc"}) ! ANY => 0';
      got = `$gender_utils:get_pronoun("s", obj) ! ANY => 0';
      if (got != "he")
        r = "gender male => " + toliteral(got);
      endif
      `recycle(obj) ! ANY => 0';
    endif
  endif
endif
if (r == 1)
  got = `$gender_utils:get_pronoun("s", #-1) ! ANY => 0';
  if (got != "it")
    r = "invalid => " + toliteral(got);
  endif
endif
return r;
.
