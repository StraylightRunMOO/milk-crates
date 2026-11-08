@verb string_utils:autofit fit_to_screen this none this rxd
@program string_utils:autofit fit_to_screen
// $string_utils:autofit/fit_to_screen(rows [, padding [, underline [, separator]]]) => LIST
// Columnized display fitted to the viewer's linelength. padding default 2.
{elements, ?padding = 2, ?underline = 0, ?separator = " "} = args;
// Verb Created by Lisdude@Toastsoft, 10/13/15
ansi_utils = $ansi_utils;
command_utils = $command_utils;
if (underline)
  lines = {};
  for x in (elements[1])
    lines = {@lines, ansi_utils:space(length(x), "-")};
  endfor
  elements = listinsert(elements, lines, 2);
endif
max = $list_utils:make(length(elements[1]));
for x in (elements)
  command_utils:suspend_if_needed(0);
  for y in [1..length(x)]
    if ((len = ansi_utils:length(x[y])) > max[y])
      max[y] = len;
    endif
  endfor
endfor
// Add padding.
for x in [1..length(max)]
  max[x] = max[x] + padding;
endfor
ret = {};
max = this:adjust_column_lengths(max);
for x in (elements)
  command_utils:suspend_if_needed(0);
  neat = {};
  for y in [1..length(x)]
    neat = {@neat, {x[y], max[y], separator}};
  endfor
  ret = {@ret, this:neat(@neat)};
endfor
return ret;
.
