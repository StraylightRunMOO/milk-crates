@verb match_utils:match_verb this none this rxd
@program match_utils:match_verb
// $match_utils:match_verb(verbname, object, args) => 0|1
// Command-style verb on object matching current prepstr/dobjstr/dobj/iobjstr/iobj.
// Skips this-none-this. If matched, calls the verb with @args and returns 1; else 0.
{vrb, what, rest} = args;
if (where = $object_utils:has_verb(what, vrb))
  if ((vargs = verb_args(where[1], vrb)) != {"this", "none", "this"})
    if (vargs[2] == "any" || (!prepstr && vargs[2] == "none") || (index("/" + vargs[2] + "/", "/" + prepstr + "/") && (vargs[1] == "any" || (!dobjstr && vargs[1] == "none") || (dobj == what && vargs[1] == "this")) && (vargs[3] == "any" || (!iobjstr && vargs[3] == "none") || (iobj == what && vargs[3] == "this")) && index(verb_info(where[1], vrb)[2], "x") && verb_code(where[1], vrb)))
      set_task_perms(caller_perms());
      what:(vrb)(@rest);
      return 1;
    endif
  endif
endif
.
