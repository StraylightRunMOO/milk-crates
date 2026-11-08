@verb code_utils:verb_usage this none this rxd
@program code_utils:verb_usage
// $code_utils:verb_usage([object, verbname]) => LIST
// default is the calling verb
set_task_perms(caller_perms());
c = callers()[1];
{?object = c[4], ?vname = c[2]} = args;
if (typeof(code = `verb_code(object, vname) ! ANY') == ERR)
  return code;
else
  doc = {};
  indent = "^$";
  for line in (code)
    if (match(line, "^\"%([^\\\"]%|\\.%)*\";$"))
      // ... now that we're sure `line' is just a string, eval() is safe...
      e = `$no_one:eval(line)[2] ! ANY => eval(line)[2]';
      if (subs = match(e, "^%(%(Usage%|Syntax%): +%)%([^ ]+%)%(.*$%)"))
        // Server is broken, hence the next three lines:
        if (subs[3][4][1] > subs[3][4][2])
          subs[3][4] = {0, -1};
        endif
        indent = "^%(" + $string_utils:space(length(substitute("%1", subs))) + " *%)%([^ ]+%)%(.*$%)";
        docverb = substitute("%3", subs);
        if (match(vname, "^[0-9]+$"))
          vname = docverb;
        endif
        doc = {@doc, substitute("%1", subs) + vname + substitute("%4", subs)};
      elseif (subs = match(e, indent))
        if (substitute("%3", subs) == docverb)
          doc = {@doc, substitute("%1", subs) + vname + substitute("%4", subs)};
        else
          doc = {@doc, e};
        endif
      else
        if (indent)
          return doc;
        endif
      endif
    else
      return doc;
    endif
  endfor
  return doc;
endif
.
