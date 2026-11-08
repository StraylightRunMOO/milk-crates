@verb object_utils:has_property this none this rxd
@program object_utils:has_property
// $object_utils:has_property(OBJ, STR) => INT
// Does object have the specified property? Returns true if it is defined on the object or a parent.
{object, prop} = args;
try
  object.(prop);
  return 1;
except (E_PROPNF, E_INVIND)
  return 0;
endtry
.
