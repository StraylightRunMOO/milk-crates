@verb time_utils:time_sub this none this rxd
@program time_utils:time_sub
// $time_utils:time_sub(string [, time]) => STR
// Pronoun-style substitution of clock/date macros. time is unix seconds; default time().
// $H/$M/$S 24h zero-padded; $h/$m/$s unpadded. $O/$o 12-hour padded/unpadded.
// $D/$d long/short day, $N/$n long/short month, $Y/$y year, $Z zone.
// $P/$p AM/PM or am/pm. $T/$t date (padded/trimmed). $1/$2 month number, $3 zero-filled date.
// $$ => $. Unknown $X dropped. Trailing $ ignored. Bad types tell player and return 0.
res = "";
{thestr, ?thetime = time()} = args;
// This verb stolen from Ozymandias's #4835:time_subst.
if (typeof(thestr) != STR || typeof(thetime) != INT)
  player:tell("Bad arguments to time_subst.");
  return;
endif
if (!length(thestr))
  return "";
endif
cctime = ctime(thetime);
while (dollar = index(thestr, "$"))
  res = res + thestr[1..dollar - 1];
  if (dollar == length(thestr))
    return res;
  endif
  thechar = thestr[dollar + 1];
  thestr[1..dollar + 1] = "";
  if (thechar == "$")
    res = res + "$";
  elseif (!strcmp(thechar, "h"))
    res = res + $string_utils:trim(tostr(toint(cctime[12..13])));
  else
    if (thechar == "H")
      res = res + cctime[12..13];
    elseif (!strcmp(thechar, "m"))
      res = res + $string_utils:trim(tostr(toint(cctime[15..16])));
    else
      if (thechar == "M")
        res = res + cctime[15..16];
      elseif (!strcmp(thechar, "s"))
        res = res + $string_utils:trim(tostr(toint(cctime[18..19])));
      else
        if (thechar == "S")
          res = res + cctime[18..19];
        elseif (!strcmp(thechar, "D"))
          res = res + $time_utils:day(thetime);
        else
          if (thechar == "d")
            res = res + cctime[1..3];
          elseif (!strcmp(thechar, "N"))
            res = res + $time_utils:month(thetime);
          else
            if (thechar == "n")
              res = res + cctime[5..7];
            elseif (!strcmp(thechar, "T"))
              res = res + cctime[9..10];
            else
              if (thechar == "t")
                res = res + $string_utils:trim(cctime[9..10]);
              elseif (!strcmp(thechar, "o"))
                res = tostr(res, (toint(cctime[12..13]) + 11) % 12 + 1);
              else
                if (thechar == "O")
                  res = res + $string_utils:right(tostr((toint(cctime[12..13]) + 11) % 12 + 1), 2, "0");
                elseif (!strcmp(thechar, "p"))
                  res = res + (toint(cctime[12..13]) >= 12 ? "pm" | "am");
                else
                  if (thechar == "P")
                    res = res + (toint(cctime[12..13]) >= 12 ? "PM" | "AM");
                  elseif (!strcmp(thechar, "y"))
                    res = res + cctime[23..24];
                  else
                    if (thechar == "Y")
                      res = res + cctime[21..24];
                    elseif (thechar == "Z")
                      res = res + cctime[26..$];
                    else
                      if (thechar == "1")
                        res = res + $string_utils:right(tostr($string_utils:explode(cctime)[2] in this.monthabbrs), 2, "0");
                      elseif (thechar == "2")
                        res = res + tostr($string_utils:explode(cctime)[2] in this.monthabbrs);
                      else
                        if (thechar == "3")
                          res = res + $string_utils:subst(cctime[9..10], {{" ", "0"}});
                        endif
                      endif
                    endif
                  endif
                endif
              endif
            endif
          endif
        endif
      endif
    endif
  endif
endwhile
return res + thestr;
.
