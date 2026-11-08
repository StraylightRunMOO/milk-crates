@verb code_utils:verb_documentation this none this rxd
@program code_utils:verb_documentation
// $code_utils:verb_documentation([object, verbname]) => LIST of leading help lines
// Defaults to the calling verb. Harvests // comments and "string"; statements.
// Stops at the first line that is neither. Does not eval.
set_task_perms(caller_perms());
c = callers()[1];
{?object = c[4], ?vname = c[2]} = args;
try
  code = verb_code(object, vname);
except error (ANY)
  return error[2];
endtry
doc = {};
for line in (code)
  if (typeof(line) != STR)
    return doc;
  elseif (length(line) >= 2 && line[1..2] == "//")
    rest = line[3..$];
    if (rest && rest[1] == " ")
      rest = rest[2..$];
    endif
    doc = {@doc, rest};
  else
    if (length(line) >= 3 && line[1] == "\"" && line[$] == ";" && line[$ - 1] == "\"")
      inner = line[2..$ - 2];
      out = "";
      i = 1;
      while (i <= length(inner))
        ch = inner[i];
        if (ch == "\\" && i < length(inner))
          out = out + inner[i + 1];
          i = i + 2;
        else
          out = out + ch;
          i = i + 1;
        endif
      endwhile
      doc = {@doc, out};
    else
      return doc;
    endif
  endif
endfor
return doc;
.
