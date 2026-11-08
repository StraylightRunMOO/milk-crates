@verb ansi_utils:notify this none this rx
@program ansi_utils:notify
// $ansi_utils:notify (OBJ player, STR line[, extra parameters for notify])
set_task_perms(caller_perms());
{plr, line, @extra} = args;
// ...use property_info() instead of $object_utils:isa to save ticks...
if (index(line, "[") && valid(plr) && property_info(plr, "ansi_options") && this.active && !(task_id() in this.noansi_queue) && !plr:ansi_option("ignore"))
  codes = typeof(z = plr.replace_codes) == NUM ? this.replace_code_pointers[z] | z;
  esc = plr:ansi_option("escape");
  // ... save more ticks here by using 'in' instead of 'ansi_option'...
  truecolor_enabled = "truecolor" in plr.ansi_options;
  xterm_256 = "256" in plr.ansi_options;
  backgrounds = "backgrounds" in plr.ansi_options;
  while (m = match(line, this.notify_regexp))
    z = line[m[1] + 1..m[2] - 1];
    if (z in codes)
      code = this:get_code(z, esc);
    elseif (!backgrounds && z[1..2] == "b:")
      code = "";
    else
      if (z[1..2] == "b:" && z[3..$] in codes)
        code = this:get_code(z, esc);
      elseif (z == "random")
        code = this:get_code(this.random_colors[random(length(this.random_colors))], esc);
      else
        if (z == ":random" && xterm_256)
          code = this:get_code(tostr(":", random(255)), esc, 0, 1);
        elseif (xterm_256 && (z[1] == ":" || z[1..3] == "b::"))
          code = this:get_code(z, esc, 0, 1);
        else
          if (truecolor_enabled && index(z, ":"))
            code = this:get_code(z, esc, m);
          else
            code = "";
          endif
        endif
      endif
    endif
    line[m[1]..m[2]] = code;
  endwhile
  line = strsub(line, "[null]", "");
endif
return notify(plr, line, @extra);
.
