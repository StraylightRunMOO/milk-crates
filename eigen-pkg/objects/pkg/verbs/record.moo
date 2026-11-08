@verb pkg:record this none none rxd
@program pkg:record
// $pkg:record
// record(name, extra) — merge extra into #0.eigen_packages[name].
name = tostr(args[1]);
extra = length(args) >= 2 && typeof(args[2]) == MAP ? args[2] | [];
pkgs = `$eigen_packages ! ANY => []';
if (typeof(pkgs) != MAP)
  pkgs = [];
endif
rec = `pkgs[name] ! ANY => []';
if (typeof(rec) != MAP)
  rec = [];
endif
for v, k in (extra)
  rec[k] = v;
endfor
pkgs[name] = rec;
$eigen_packages = pkgs;
return rec;
.
