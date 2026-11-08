@verb object_utils:match_verb this none this rxd
@program object_utils:match_verb
// $object_utils:match_verb(OBJ object, STR verb) => LIST|0
// Find out if an object has a given verb, and some information about it.
// Returns {OBJ location, STR verb} if matched, 0 if not.
// Location is the object on which it is actually defined, verb is a name
// for the verb which can subsequently be used in verb_info (i.e., no
// asterisks).
verbname = strsub(args[2], "*", "");
object = args[1];
while (E_VERBNF == (info = `verb_info(object, verbname) ! E_VERBNF, E_INVARG'))
  object = parent(object);
endwhile
return info ? {object, verbname} | 0;
.
