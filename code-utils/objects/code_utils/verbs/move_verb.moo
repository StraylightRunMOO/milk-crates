@verb code_utils:move_verb this none this rxd
@program code_utils:move_verb
// $code_utils:move_verb(OBJ from, STR verb, OBJ to[, STR newname]) => {OBJ, STR}|ERR
// Moves the verb. caller_perms() must control both objects and own the verb, unless wizard.
// Should handle verbnames with aliases and wildcards correctly.
who = caller_perms();
{from, origverb, to, ?destverb = origverb} = args;
if (typeof(from) != OBJ || typeof(to) != OBJ || typeof(origverb) != STR || typeof(destverb) != STR)
  // check this first so we can parse out long verb names next
  return E_TYPE;
endif
origverb_first = strsub(origverb[1..index(origverb + " ", " ") - 1], "*", "") || "*";
destverb_first = strsub(destverb[1..index(destverb + " ", " ") - 1], "*", "") || "*";
if (!valid(from) || !valid(to))
  return E_INVARG;
elseif (from == to && destverb == origverb)
  // Moving same origverb onto the same object puts the verbcode in the wrong one. Just not allow
  return E_NACC;
else
  if (!$perm_utils:controls(who, from) && !from.w || (!$perm_utils:controls(who, to) && !to.w))
    // caller_perms() is not allowed to hack on either object in question
    return E_PERM;
  elseif (!$object_utils:defines_verb(from, origverb_first))
    // verb is not defined on the from object
    return E_VERBNF;
  else
    if ((vinfo = verb_info(from, origverb_first)) && !$perm_utils:controls(who, vinfo[1]))
      // caller_perms() is not permitted to add a verb with the existing verb owner
      return E_PERM;
    elseif (!who.programmer)
      return E_PERM;
    else
      // we now know that the caller's perms control the objects or the objects are writable, and we know that the caller's perms control the prospective verb owner (by more traditional means)
      vcode = verb_code(from, origverb_first);
      vargs = verb_args(from, origverb_first);
      vinfo[3] = destverb == origverb ? vinfo[3] | destverb;
      if (typeof(res = `add_verb(to, vinfo, vargs) ! ANY') == ERR)
        return res;
      else
        set_verb_code(to, destverb_first, vcode);
        delete_verb(from, origverb_first);
        return {to, vinfo[3]};
      endif
    endif
  endif
endif
.
