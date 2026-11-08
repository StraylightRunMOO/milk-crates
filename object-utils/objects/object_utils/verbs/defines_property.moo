@verb object_utils:defines_property this none this rxd
@program object_utils:defines_property
// $object_utils:defines_property(OBJ object, STR property name) => INT
// Returns 1 if the property is actually *defined* on the object given
if (!valid(o = args[1]))
  return 0;
elseif (!valid(p = parent(o)))
  return this:has_property(o, args[2]);
else
  return !this:has_property(p, args[2]) && this:has_property(o, args[2]);
endif
.
