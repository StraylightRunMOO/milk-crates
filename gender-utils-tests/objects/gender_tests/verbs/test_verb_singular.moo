@verb gender_tests:test_verb_singular this none none rxd
@program gender_tests:test_verb_singular
got = `$gender_utils:_verb_singular("walk") ! ANY => 0';
if (got != "walks")
  return "walk => " + toliteral(got);
endif
got = `$gender_utils:_verb_singular("try") ! ANY => 0';
if (got != "tries")
  return "try => " + toliteral(got);
endif
got = `$gender_utils:_verb_singular("are") ! ANY => 0';
if (got != "is")
  return "are => " + toliteral(got);
endif
return 1;
.
