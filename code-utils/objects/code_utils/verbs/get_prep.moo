@verb code_utils:get_prep this none this rxd
@program code_utils:get_prep
// $code_utils:get_prep(@args) => {prep, @unused}
// Extracts the prepositional phrase from the front of args.
// :get_prep("in","front","of",...) => {"in front of",...}
// :get_prep("inside",...)          => {"inside",...}
// :get_prep("frabulous",...}       => {"", "frabulous",...}
prep = "";
allpreps = {@this._short_preps, @this._other_preps};
rest = 1;
for i in [1..length(args)]
  accum = i == 1 ? args[1] | tostr(accum, " ", args[i]);
  if (accum in allpreps)
    prep = accum;
    rest = i + 1;
  endif
  if (!(accum in this._multi_preps))
    return {prep, @args[rest..$]};
  endif
endfor
return {prep, @args[rest..$]};
.
