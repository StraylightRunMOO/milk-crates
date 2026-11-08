@verb string_utils:end_expression this none this rxd
@program string_utils:end_expression
// $string_utils:end_expression(string [, stop_at]) => INT
// Index of last char of a leading expression, or 0 if it is not an expression.
// Expression ends at any top-level char from stop_at (default space).
{string, ?stop_at = " "} = args;
gone = 0;
paren_stack = "";
inquote = 0;
search = top_level_search = "[][{}()\"" + strsub(stop_at, "]", "") + "]";
paren_search = "[][{}()\"]";
while (m = match(string, search))
  char = string[m[1]];
  string[1..m[2]] = "";
  gone = gone + m[2];
  if (char == "\"")
    // ...skip over quoted string...
    char = "\\";
    while (char == "\\")
      if (!(m = match(string, "%(\\.?%|\"%)")))
        return 0;
      endif
      char = string[m[1]];
      string[1..m[2]] = "";
      gone = gone + m[2];
    endwhile
  elseif (index("([{", char))
    // ... push parenthesis...
    paren_stack[1..0] = char;
    search = paren_search;
  else
    if (i = index(")]}", char))
      if (paren_stack && "([{"[i] == paren_stack[1])
        // ... pop parenthesis...
        paren_stack[1..1] = "";
        search = paren_stack ? paren_search | top_level_search;
      else
        // ...parenthesis mismatch...
        return 0;
      endif
    else
      // ... stop character ...
      return gone - 1;
    endif
  endif
endwhile
return !paren_stack && gone + length(string);
.
