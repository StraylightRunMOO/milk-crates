@verb object_utils:defines_verb this none this rxd
@program object_utils:defines_verb
// $object_utils:defines_verb(OBJ object, STR verb) => INT
// Returns 1 if the verb is actually *defined* on this object, 0 else.
// Use this instead of :has_verb if your aim is to manipulate that verb code or whatever.
return `verb_info(@args) ! ANY => 0' && 1;
.
