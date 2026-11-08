@verb string_utils:strip_chars this none this rxd
@program string_utils:strip_chars
// $string_utils:strip_chars(string, chars) => STR
// Remove every character that appears in chars.
{subject, stripped} = args;
for i in [1..length(stripped)]
  subject = strsub(subject, stripped[i], "");
endfor
return subject;
.
