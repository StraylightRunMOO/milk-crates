@verb object_utils:isa this none this rxd
@program object_utils:isa
// $object_utils:isa(what, targ [, return_parent]) => INT|OBJ
{what, targ, ?return_parent = 0} = args;
if (typeof(what) == OBJ && typeof(targ) in {OBJ, LIST})
  return isa(@args);
elseif (typeof(what) == WAIF && typeof(targ) in {OBJ, LIST})
  return isa(what.class, targ, return_parent);
else
  if (typeof(what) == WAIF && typeof(targ) == WAIF)
    return isa(what.class, targ.class, return_parent);
  elseif (typeof(what) == OBJ && typeof(targ) == WAIF)
    return isa(targ.class, what, return_parent);
  else
    raise(E_INVARG);
  endif
endif
.
