@verb math_utils:base_conversion this none this rxd
@program math_utils:base_conversion
// $math_utils:base_conversion(number, from_base, to_base [, case_sensitive]) => STR|ERR
// Convert number (STR|INT) between bases 2..62. A=10..Z=35, a=36..z=61 if case_sensitive.
sensitive = 0;
if (length(args) < 3)
  return E_INVARG;
elseif (length(args) == 4)
  sensitive = toint(args[4]);
endif
result = 0;
thenum = tostr(args[1]);
origbase = toint(args[2]);
newbase = toint(args[3]);
if (origbase < 2 || newbase < 2 || origbase > 62 || newbase > 62)
  return E_INVARG;
endif
for which in [1..length(thenum)]
  value = index(this.base_alphabet, thenum[which], sensitive);
  if (!value || value > origbase)
    return E_INVARG;
  endif
  result = result * origbase + value - 1;
endfor
thestring = "";
if (result < 0)
  return E_INVARG;
endif
while (result)
  if ((which = result % newbase + 1) <= length(this.base_alphabet))
    thestring = this.base_alphabet[which] + thestring;
  else
    return E_INVARG;
  endif
  result = result / newbase;
endwhile
return thestring ? thestring | "0";
.
