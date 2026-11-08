@verb code_utils:toerr this none this rxd
@program code_utils:toerr
// $code_utils:toerr(n|"E_FOO"|"FOO") => ERR|1
if (typeof(s = args[1]) != STR)
  n = toint(s) + 1;
  if (n > length(this.error_list))
    return 1;
  endif
elseif (!(n = s in this.error_names || "E_" + s in this.error_names))
  return 1;
endif
return this.error_list[n];
.
