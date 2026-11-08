@verb string_utils:common this none this rxd
@program string_utils:common
// $string_utils:common(first, second) => INT
// Length of the longest common prefix of two strings.
{first, second} = args;
r = min(length(first), length(second));
l = 1;
while (r >= l)
  h = (r + l) / 2;
  if (first[l..h] == second[l..h])
    l = h + 1;
  else
    r = h - 1;
  endif
endwhile
return r;
.
