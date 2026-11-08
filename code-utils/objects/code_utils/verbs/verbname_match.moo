@verb code_utils:verbname_match this none this rxd
@program code_utils:verbname_match
// $code_utils:verbname_match(fullverbname, name) => 0|1
verblist = " " + args[1] + " ";
if (index(verblist, " " + (name = args[2]) + " ") && !(index(name, "*") || index(name, " ")))
  // Note that if name has a * or a space in it, then it can only match one of the * verbnames
  return 1;
else
  namelen = length(name);
  while (star = index(verblist, "*"))
    vstart = rindex(verblist[1..star], " ") + 1;
    vlast = vstart + index(verblist[vstart..$], " ") - 2;
    if (namelen >= star - vstart && (!(v = strsub(verblist[vstart..vlast], "*", "")) || index(v, verblist[vlast] == "*" ? name[1..min(namelen, length(v))] | name) == 1))
      return 1;
    endif
    verblist = verblist[vlast + 1..$];
  endwhile
endif
return 0;
.
