@verb string_utils:unbreak this none this rxd
@program string_utils:unbreak
// $string_utils:unbreak(lines) => LIST|ANY
// Join wrapped paragraphs. Blank line or indent change starts a new paragraph.
// Non-list argument is returned unchanged.
text = args[1];
if (typeof(text) != LIST)
  return text;
endif
// mode 0 = idle, 1 = indented paragraph, -1 = hanging/flush paragraph.
mode = 0;
done = {};
temp = "";
for line in (text)
  empty = line == "";
  indented = !empty && line[1] == " ";
  if (mode == 0)
    if (empty)
      done = {@done, line};
    else
      mode = indented ? 1 | -1;
      temp = line;
    endif
  elseif (empty)
    done = temp == "" ? {@done, line} | {@done, temp, line};
    temp = "";
    mode = 0;
  else
    if (mode == 1)
      if (indented)
        if (temp != "")
          done = {@done, temp};
        endif
        temp = line;
      else
        gap = temp[$] == " " ? "" | " ";
        temp = temp + gap + line;
      endif
    elseif (indented)
      gap = temp[$] == " " ? "" | " ";
      temp = temp + gap + this:triml(line);
    else
      if (temp != "")
        done = {@done, temp};
      endif
      temp = line;
    endif
  endif
endfor
if (temp != "")
  done = {@done, mode == -1 ? this:triml(temp) | temp};
endif
return done;
.
