@verb gender_tests:test_verb_plural this none none rxd
@program gender_tests:test_verb_plural
got = `$gender_utils:_verb_plural("walks", 1) ! ANY => 0';
if (got != "walk")
  return "walks => " + toliteral(got);
endif
got = `$gender_utils:_verb_plural("is", 7) ! ANY => 0';
if (got != "are")
  return "is plural => " + toliteral(got);
endif
got = `$gender_utils:_verb_plural("tries", 1) ! ANY => 0';
if (got != "try")
  return "tries => " + toliteral(got);
endif
return 1;
.
