@verb object_utils:owned_properties this none this rxd
@program object_utils:owned_properties
// $object_utils:owned_properties(what[, who]) => LIST
// Return a list of all properties on WHAT owned by WHO.
// Only wizardly verbs can specify WHO; mortal verbs can only search for properties owned by their own owners.  For more information, talk to Gary_Severn.
what = anc = args[1];
who = (c = caller_perms()).wizard && length(args) > 1 ? args[2] | c;
props = {};
while (anc != `$nothing ! ANY => #-1')
  for k in (properties(anc))
    if (property_info(what, k)[1] == who)
      props = listappend(props, k);
    endif
  endfor
  anc = parent(anc);
endwhile
return props;
.
