@verb object_utils:ancestors this none this rxd
@program object_utils:ancestors
// $object_utils:ancestors(object[, object...]) => LIST
// Return a list of all ancestors of the object(s) in args, with no duplicates.
// If called with a single object, the result will be in order ascending up the inheritance hierarchy.  If called with multiple objects, it probably won't.
return ancestors(@args);
.
