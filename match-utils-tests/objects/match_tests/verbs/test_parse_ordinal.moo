@verb match_tests:test_parse_ordinal this none none rxd
@program match_tests:test_parse_ordinal
p = `$match_utils:parse_ordinal_reference("second broadsword") ! ANY => 0';
if (p != {2, "broadsword"})
  return "second broadsword => " + toliteral(p);
endif
p = `$match_utils:parse_ordref("1st axe") ! ANY => 0';
if (p != {1, "axe"})
  return "1st axe => " + toliteral(p);
endif
p = `$match_utils:parse_ordinal_reference("fifth sword") ! ANY => 0';
if (p != {5, "sword"})
  return "fifth sword => " + toliteral(p);
endif
p = `$match_utils:parse_ordinal_reference("10th staff") ! ANY => 0';
if (p != {10, "staff"})
  return "10th staff => " + toliteral(p);
endif
if (`$match_utils:parse_ordinal_reference("second") ! ANY => 1')
  return "ordinal alone";
endif
if (`$match_utils:parse_ordinal_reference("11th axe") ! ANY => 1')
  return "unknown ordinal";
endif
if (`$match_utils:parse_ordinal_reference("") ! ANY => 1')
  return "empty";
endif
if (`$match_utils:parse_ordinal_reference("second a") ! ANY => 1')
  return "one-char rest";
endif
return 1;
.
