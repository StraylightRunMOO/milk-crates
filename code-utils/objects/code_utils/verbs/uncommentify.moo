@verb code_utils:uncommentify this none this rxd
@program code_utils:uncommentify
// $code_utils:uncommentify(lines) => LIST|ERR
// 
// Given lines of comment code, translate them into text and return the list.
set_task_perms(`$no_one ! ANY => player');
{lines} = args;
out = {};
for line in (lines)
  if (match(line, "^\"%([^\\\"]%|\\.%)*\";$"))
    out = {@out, eval("return " + line)[2]};
  else
    return E_INVARG;
  endif
endfor
return out;
.
