@verb object_utils:has_verb this none this rxd
@program object_utils:has_verb
// $object_utils:has_verb(OBJ object, STR verbname) => LIST|0
// Find out if an object has a verb matching the given verbname.
// Returns {location} if so, 0 if not, where location is the object or the ancestor on which the verb is actually defined.
{object, verbname} = args;
while (valid(object))
  try
    if (verb_info(object, verbname))
      return {object};
    endif
  except (E_VERBNF)
    object = parent(object);
  endtry
endwhile
return 0;
.
