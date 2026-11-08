@verb object_tests:make_tree this none this rxd
@program object_tests:make_tree
// make_tree() => {root, a, b, c}|0
// Inheritance: root <- a <- c, root <- b. Caller recycles.
root = `create($root_class) ! ANY => 0';
a = `create($root_class) ! ANY => 0';
b = `create($root_class) ! ANY => 0';
c = `create($root_class) ! ANY => 0';
ok = typeof(root) == OBJ && valid(root) && typeof(a) == OBJ && valid(a) && typeof(b) == OBJ && valid(b) && typeof(c) == OBJ && valid(c);
if (!ok)
  this:recycle_all(root, a, b, c);
  return 0;
endif
`chparent(a, root) ! ANY => 0';
`chparent(b, root) ! ANY => 0';
`chparent(c, a) ! ANY => 0';
if (parent(a) != root || parent(b) != root || parent(c) != a)
  this:recycle_all(c, a, b, root);
  return 0;
endif
return {root, a, b, c};
.
