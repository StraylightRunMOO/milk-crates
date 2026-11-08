@verb building_utils:audit_object_category this none this rxd
@program building_utils:audit_object_category
// $building_utils:audit_object_category(object) => STR
// One-character class for @audit/@prospectus. "P" for players.
if (is_player(what = args[1]))
  return "P";
endif
while (valid(what))
  if (i = what in this.classes)
    return this.class_string[i];
  endif
  what = parent(what);
endwhile
return " ";
.
