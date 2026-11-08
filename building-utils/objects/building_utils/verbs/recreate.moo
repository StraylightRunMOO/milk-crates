@verb building_utils:recreate this none this rxd
@program building_utils:recreate
// $building_utils:recreate(object, newparent) => 1|ERR
// Recycle and recreate object as a child of newparent. Returns true if successful.
{object, parent} = args;
who = caller_perms();
if (!(valid(object) && valid(parent)))
  return E_INVARG;
elseif (who.wizard)
  // no problemo
else
  if (who != object.owner || (who != parent.owner && !parent.f))
    return E_PERM;
  endif
endif
// Chparent children to their grandparent instead of orphaning them.
grandpa = parent(object);
for c in (children(object))
  chparent(c, grandpa);
endfor
for item in (object.contents)
  if (!is_player(item))
    move(item, $nothing);
  else
    move(item, $player_start);
  endif
endfor
set_task_perms(who);
if ($object_utils:has_callable_verb(object, "recycle"))
  object:recycle();
endif
chparent(object, $nothing);
for p in (properties(object))
  delete_property(object, p);
endfor
for v in (verbs(object))
  delete_verb(object, 1);
endfor
chparent(object, parent);
object.name = "";
object.r = 0;
object.f = 0;
object.w = 0;
if ($object_utils:has_callable_verb(parent, "initialize"))
  object:initialize();
endif
return 1;
.
