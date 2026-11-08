@verb string_tests:test_match this none none rxd
@program string_tests:test_match
if ($string_utils:literal_object("") != $nothing)
  return "literal empty";
endif
if ($string_utils:literal_object("xyzzy") != $failed_match)
  return "literal fail";
endif
lit = `$string_utils:literal_object(tostr($string_utils)) ! ANY => 0';
if (valid($string_utils) && lit != $string_utils && lit != 0)
  return "literal objnum => " + toliteral(lit);
endif
if ($string_utils:match("") != $nothing)
  return "match empty";
endif
m = `$string_utils:match($string_utils.name, {$string_utils}, "name") ! ANY => 0';
if (m != $string_utils)
  return "match name => " + toliteral(m);
endif
ms = `$string_utils:match_suspended($string_utils.name, {$string_utils}, "name") ! ANY => 0';
if (ms != $string_utils)
  return "match_suspended => " + toliteral(ms);
endif
`$string_utils:match_object("me", `player.location ! ANY => $nothing') ! ANY => 0';
mp = `$string_utils:match_player("") ! ANY => 0';
if (mp != $nothing && mp != 0)
  return "match_player empty => " + toliteral(mp);
endif
`$string_utils:match_player_or_object() ! ANY => 0';
return 1;
.
