@verb code_utils:callers_text this none this rxd
@program code_utils:callers_text
// $code_utils:callers_text([callers() style list]) => LIST
// Returns the output of the given callers() style list. Uses callers() if no argument is passed.
linelen = min(player:linelen(), 200);
text = {};
su = $string_utils;
lu = $list_utils;
verbwidth = 0;
{?match = callers(1)} = args;
for verbitem in (lu:slice(match, 2))
  verbwidth = max(verbwidth, length(verbitem));
endfor
verbwidth = 3 + verbwidth;
numwidth = (linelen - verbwidth) / 4 - 1;
widths = {numwidth, verbwidth, numwidth, numwidth, numwidth};
top = l = between = "";
for x in [1..5]
  top = top + between + su:left({"This", "Verb", "Permissions", "VerbLocation", "Player"}[x], -widths[x]);
  l = l + between + su:space(widths[x], "-");
  between = " ";
endfor
text = listappend(text, top);
text = listappend(text, l);
for line in (match)
  output = {};
  for bit in [1..5]
    $command_utils:suspend_if_needed(3);
    // bit == 2 below for verb: append line number.
    output = {@output, su:left(typeof(word = line[bit]) == STR ? bit == 2 ? tostr(word, "(", `line[6] ! ANY => 0', ")") | word | tostr(word, "(", valid(word) ? lu:shortest({word.name, @word.aliases}) | (word == `$nothing ! ANY => #-1' ? "invalid" | (word == `$ambiguous_match ! ANY => #-2' ? "ambiguous match" | "Error")), ")"), -widths[bit]), " "};
  endfor
  text = listappend(text, su:trimr(tostr(@output)));
endfor
text = listappend(text, l);
return text;
.
