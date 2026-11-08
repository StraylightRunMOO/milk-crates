@verb object_utils:has_callable_verb this none this rxd
@program object_utils:has_callable_verb
// $object_utils:has_callable_verb(object, verb) => LIST|0
// See if an object has a verb that can be called by another verb (i.e., that has its x permission bit set).
// Return {location}, where location is the object that defines the verb, or 0 if the object doesn't have the verb.
{object, verbname} = args;
if (typeof(object) == WAIF)
  object = object.class;
  verbname = ":" + verbname;
endif
return `{respond_to(object, verbname)[1]} ! ANY => 0';
.
