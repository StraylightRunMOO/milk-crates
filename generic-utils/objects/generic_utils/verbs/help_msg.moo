@verb generic_utils:help_msg this none this rxd
@program generic_utils:help_msg
// $generic_utils:help_msg() => LIST
// Documentation for every verb on this object, from $code_utils:verb_documentation.
// Inherited by *-utils children. pass() yields if a parent already answered.
if (a = `pass(@args) ! ANY => 0')
  return a;
endif
lines = {};
for v in (verbs(this))
  docs = `$code_utils:verb_documentation(this, v) ! ANY => {}';
  if (typeof(docs) != LIST)
    docs = {};
  endif
  lines = {@lines, "======================", tostr(this, ":", v), @docs};
endfor
return {@lines, "======================", "If this is a corified utilities package, there may be more info under 'help $<core name>'."};
.
