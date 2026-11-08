@verb gender_utils:get_pronoun this none this rxd
@program gender_utils:get_pronoun
// $gender_utils:get_pronoun(key [, object]) => STR
// get_pronoun(key,object) => pronoun corresponding to object.
// key can be one of s,o,p,q,r,S,O,P,Q,R to refer to the pronoun properties relatively directly or it can be something of the form "he/she" or "He/She".
// Next the object is checked for the desired pronoun property.  If that doesn't exist, we look at object.gender and infer the pronoun from the corresponding $gender_utils property.  If .gender doesn't exist or the object itself is invalid, we use the corresponding property on $player, or this.(prop)[1] (neuter) if $player is missing.
{key, ?object = player} = args;
if (key[1] == ":")
  key = key[2..$];
endif
if (length(key) == 1 && (i = index("sopqrSOPQR", key, 1)))
  prop = this.pronouns[i];
else
  search = "$1:he$1:she$1:they$1:he/she$1:he/she/they$2:him$2:them$2:him/her$2:him/her/them$3:their$3:his/her$3:his/her/their$4:hers$4:theirs$4:his/hers$4:his/hers/theirs$5:himself$5:herself$5:themself$5:himself/herself$5:himself/herself/themself";
  i = index(search, ":" + key + "$");
  if (!i)
    return "";
  endif
  cap = strcmp("a", key) > 0;
  prop = this.pronouns[toint(search[i - 1]) + 5 * cap];
endif
fallback = `this.(prop)[1] ! ANY => ""';
if (!valid(object))
  return `$player.(prop) ! ANY => fallback';
elseif (STR == typeof(p = `object.(prop) ! ANY') && p)
  return p;
else
  if (STR == typeof(g = `object.gender ! ANY') && (gnum = g in this.genders))
    vals = `this.(prop) ! ANY => 0';
    if (typeof(vals) == LIST && gnum <= length(vals))
      return vals[gnum];
    endif
  endif
  return `$player.(prop) ! ANY => fallback';
endif
.
