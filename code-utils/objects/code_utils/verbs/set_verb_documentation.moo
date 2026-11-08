@verb code_utils:set_verb_documentation this none this rxd
@program code_utils:set_verb_documentation
// $code_utils:set_verb_documentation(object, verbname, text) => 1 or E_*
// Replaces the leading help block. text is a string or list of strings.
// Writes // lines so verb_code() / help round-trip on EigenMOO.
set_task_perms(caller_perms());
{object, vname, text} = args;
code = `verb_code(object, vname) ! ANY';
if (typeof(code) == ERR)
  return code;
endif
vd = this:verb_documentation(object, vname);
if (typeof(vd) == ERR)
  return vd;
endif
if (!(typeof(text) in {LIST, STR}))
  return E_INVARG;
endif
newdoc = {};
for l in (typeof(text) == LIST ? text | {text})
  if (typeof(l) != STR)
    return E_INVARG;
  endif
  newdoc = {@newdoc, "// " + l};
endfor
svc = `set_verb_code(object, vname, {@newdoc, @code[length(vd) + 1..$]}) ! ANY';
if (typeof(svc) == ERR)
  return svc;
endif
return 1;
.
