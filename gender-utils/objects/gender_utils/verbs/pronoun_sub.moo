@verb gender_utils:pronoun_sub this none this rxd
@program gender_utils:pronoun_sub
// $gender_utils:pronoun_sub(text [, who]) => STR|LIST
// Experimental pronoun substitution. The official version is on $string_utils.
// syntax:  :pronoun_sub(text[,who])
// experimental version that accomodates Aladdin's style...
set_task_perms(`$no_one ! ANY => player');
{old, ?who = player} = args;
if (typeof(old) == LIST)
  plines = {};
  for line in (old)
    plines = {@plines, this:pronoun_sub(line, who)};
  endfor
  return plines;
endif
new = "";
here = valid(who) ? who.location | `$nothing ! ANY => #-1';
objspec = "nditl";
objects = {who, dobj, iobj, caller, here};
prnspec = "sopqrSOPQR";
prprops = {"ps", "po", "pp", "pq", "pr", "Ps", "Po", "Pp", "Pq", "Pr"};
oldlen = length(old);
while ((prcnt = index(old, "%")) && prcnt < oldlen)
  cp_args = {};
  s = old[k = prcnt + 1];
  if (brace = index("([{", s))
    if (!(w = index(old[k + 1..oldlen], ")]}"[brace])))
      return new + old;
    elseif (brace == 3)
      s = this:_do(0, who, old[prcnt + 2..(k = k + w) - 1]);
    else
      p = old[prcnt + 2..(k = k + w) - 1];
      if (brace == 1)
        cp_args = {who, p};
      elseif (p[1] == "#")
        s = (o = index(objspec, p[2])) ? tostr(objects[o]) | "[" + p + "]";
      else
        if (!(o = index(objspec, p[1])))
          s = "[" + p + "]";
        else
          cp_args = {objects[o], p[2..w - 1], strcmp(p[1], "a") < 0};
        endif
      endif
    endif
  elseif (o = index(objspec, s))
    cp_args = {objects[o], "", strcmp(s, "a") < 0};
  else
    if (w = index(prnspec, s, 1))
      cp_args = {who, prprops[w]};
    elseif (s == "#")
      s = tostr(who);
    else
      if (s != "%")
        s = "%" + s;
      endif
    endif
  endif
  new = new + old[1..prcnt - 1] + (!cp_args ? s | (typeof(sub = $string_utils:_cap_property(@cp_args)) != ERR ? sub | "%(" + tostr(sub) + ")"));
  old = old[k + 1..oldlen];
  oldlen = oldlen - k;
endwhile
return new + old;
.
