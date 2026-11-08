@verb string_tests:test_pronoun this none none rxd
@program string_tests:test_pronoun
if ($string_utils:pronoun_quote("%n") != "%%n")
  return "pronoun_quote";
endif
if ($string_utils:pronoun_sub("%%") != "%")
  return "pronoun_sub percent";
endif
ps = `$string_utils:pronoun_sub("%n", $string_utils) ! ANY => 0';
if (ps != $string_utils.name)
  return "pronoun_sub name => " + toliteral(ps);
endif
alt = `$string_utils:alt_pronoun_sub("%%") ! ANY => 0';
if (alt != "%")
  return "alt_pronoun_sub => " + toliteral(alt);
endif
sec = `$string_utils:pronoun_sub_secure("%n", $string_utils, "fallback") ! ANY => 0';
if (sec != $string_utils.name)
  return "pronoun_sub_secure => " + toliteral(sec);
endif
return 1;
.
