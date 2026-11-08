@verb test_utils:run this none none rxd
@program test_utils:run
// $test_utils:run
// run(obj) — call every test_* verb on obj. Else obj:run() if it returns a suite map.
obj = length(args) >= 1 ? args[1] | #-1;
if (typeof(obj) != OBJ || !valid(obj))
  return ["ok" -> 0, "errors" -> {"run() needs an object"}];
endif
this:begin(tostr(obj));
vs = `verbs(obj) ! ANY => {}';
n = 0;
for v in (vs)
  name = v;
  sp = index(v, " ");
  if (sp)
    name = v[1..sp - 1];
  endif
  if (index(name, "test_") == 1)
    n = n + 1;
    r = 0;
    try
      r = obj:(name)();
    except e (ANY)
      this:fail(name + ": " + toliteral(e[1]) + " " + tostr(e[2]));
      continue;
    endtry
    if (typeof(r) == STR)
      this:fail(name + ": " + r);
    elseif (r)
      this:ok(name);
    else
      this:fail(name + " returned false");
    endif
  endif
endfor
if (!n)
  r = 0;
  try
    r = obj:run();
  except e (ANY)
    this:fail("run: " + toliteral(e[1]) + " " + tostr(e[2]));
    return this:finish();
  endtry
  if (typeof(r) == MAP)
    return r;
  endif
  this:fail("no test_* verbs and :run did not return a suite");
endif
return this:finish();
.
