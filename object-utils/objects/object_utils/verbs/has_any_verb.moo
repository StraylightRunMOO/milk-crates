@verb object_utils:has_any_verb has_any_property this none this rxd
@program object_utils:has_any_verb has_any_property
// $object_utils:has_any_verb(object) => INT
// :has_any_property(object)
// -- does `object' have any verbs/properties?
return !!`verb == "has_any_verb" ? verbs(args[1]) | properties(args[1]) ! E_INVARG => 0';
.
