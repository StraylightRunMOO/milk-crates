@verb match_tests:test_help this none none rxd
@program match_tests:test_help
names = {"match", "match_list", "match_nth", "match_verb", "object_match_failed", "parse_ordinal_reference", "parse_possessive_reference", "init_for_core"};
for n in (names)
  code = `verb_code($match_utils, n) ! ANY => 0';
  if (typeof(code) != LIST || !code)
    return "no verb_code " + n;
  endif
  if (length(code[1]) < 2 || code[1][1..2] != "//" || !index(code[1], "$match_utils:" + n))
    return n + " help => " + toliteral(code[1]);
  endif
endfor
code = `verb_code($match_utils, "match") ! ANY => 0';
if (!index(code[1], "$match_utils:match"))
  return "match signature";
endif
return 1;
.
