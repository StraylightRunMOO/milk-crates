@verb code_utils:prepositions this none this rxd
@program code_utils:prepositions
// $code_utils:prepositions() => LIST
if (server_version() != this._version)
  this:_fix_preps();
endif
return this.prepositions;
.
