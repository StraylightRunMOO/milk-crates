@verb match_utils:parse_possessive_reference this none this rxd
@program match_utils:parse_possessive_reference
// $match_utils:parse_possessive_reference(string) => {STR, STR}|0
// "joe's cat" => {"joe", "cat"}; "sis' fish" => {"sis", "fish"}; "my dog" => {"me", "dog"}.
// Possessive alone ("my", "yduJ's") => {who, ""}. Not possessive => 0.
string = args[1];
if (m = match(string, "^my$%|^my +%(.+%)?"))
  return {"me", substitute("%1", m)};
elseif (m = match(string, "^%(.+s?%)'s? *%(.+%)?"))
  return {substitute("%1", m), substitute("%2", m)};
else
  return 0;
endif
// Profane (#30788) - Sun Jun 21, 1998 - changed first parenthetical match bit from %([^ ]+s?%) to %(.+s?%)
.
