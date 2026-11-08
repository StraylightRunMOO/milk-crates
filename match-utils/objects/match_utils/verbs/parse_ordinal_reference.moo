@verb match_utils:parse_ordinal_reference parse_ordref this none this rxd
@program match_utils:parse_ordinal_reference parse_ordref
// $match_utils:parse_ordinal_reference/parse_ordref(string) => {INT, STR}|0
// "second broadsword" => {2, "broadsword"}; "1st axe" => {1, "axe"}.
// Ordinal alone ("second") or unknown ordinal => 0. Rest after the ordinal must be at least two characters.
if (m = match(args[1], "^" + this.ordinal_regexp + " +%([^ ].+%)$"))
  o = substitute("%1", m);
  n = o in this.ordn || o in this.ordw;
  return n && {n, substitute("%2", m)};
else
  return 0;
endif
.
