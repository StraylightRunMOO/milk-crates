@verb code_utils:_fix_preps this at/to this rxd
@program code_utils:_fix_preps
// $code_utils:_fix_preps() updates preposition properties
// _fix_preps should be called whenever we detect that a new server version has been installed.
orig_args = verb_args(this, verb);
multis = nothers = others = shorts = longs = {};
i = 0;
while (typeof(`set_verb_args(this, verb, {"this", tostr(i), "this"}) ! ANY') != ERR)
  l = verb_args(this, verb)[2];
  all = $string_utils:explode(l, "/");
  s = all[1];
  for p in (listdelete(all, 1))
    if (length(p) <= length(s))
      s = p;
    endif
  endfor
  for p in (all)
    while (j = rindex(p, " "))
      multis = {p = p[1..j - 1], @multis};
    endwhile
  endfor
  longs = {@longs, l};
  shorts = {@shorts, s};
  others = {@others, @setremove(all, s)};
  nothers = {@nothers, @$list_utils:make(length(all) - 1, length(shorts))};
  i = i + 1;
endwhile
set_verb_args(this, verb, orig_args);
if (longs)
  this.prepositions = longs;
  this._short_preps = shorts;
  this._other_preps = others;
  this._other_preps_n = nothers;
  this._multi_preps = multis;
endif
this._version = server_version();
return;
.
