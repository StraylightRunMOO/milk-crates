@verb pkg:review this none none rxd
@program pkg:review
// $pkg:review
// review(name) — snap_plan without applying.
return snap_plan(tostr(args[1]), ["cored" -> 1]);
.
