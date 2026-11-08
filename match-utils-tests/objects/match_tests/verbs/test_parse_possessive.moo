@verb match_tests:test_parse_possessive this none none rxd
@program match_tests:test_parse_possessive
p = `$match_utils:parse_possessive_reference("joe's cat") ! ANY => 0';
if (p != {"joe", "cat"})
  return "joe's cat => " + toliteral(p);
endif
p = `$match_utils:parse_possessive_reference("sis' fish") ! ANY => 0';
if (p != {"sis", "fish"})
  return "sis' fish => " + toliteral(p);
endif
p = `$match_utils:parse_possessive_reference("my dog") ! ANY => 0';
if (p != {"me", "dog"})
  return "my dog => " + toliteral(p);
endif
p = `$match_utils:parse_possessive_reference("my") ! ANY => 0';
if (typeof(p) != LIST || p[1] != "me" || p[2])
  return "my => " + toliteral(p);
endif
p = `$match_utils:parse_possessive_reference("where's sai") ! ANY => 0';
if (p != {"where", "sai"})
  return "where's sai => " + toliteral(p);
endif
p = `$match_utils:parse_possessive_reference("yduJ's") ! ANY => 0';
if (typeof(p) != LIST || p[1] != "yduJ" || p[2])
  return "yduJ's => " + toliteral(p);
endif
if (`$match_utils:parse_possessive_reference("foo") ! ANY => 1')
  return "not possessive";
endif
if (`$match_utils:parse_possessive_reference("") ! ANY => 1')
  return "empty";
endif
return 1;
.
